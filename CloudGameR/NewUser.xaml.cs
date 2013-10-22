using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;

namespace CloudGameR
{
    /// <summary>
    /// Interaction logic for NewUser.xaml
    /// </summary>
    public partial class NewUser : Window
    {
        private UserDataSet UserData;
        private UserDataSetTableAdapters.UtilizadorTableAdapter taUser;
        private UserDataSetTableAdapters.TableAdapterManager taUserManager;

        private CountryDataSet CountryData;
        private CountryDataSetTableAdapters.PaisTableAdapter taPais;
        private CountryDataSetTableAdapters.TableAdapterManager taManager;
        private CollectionView View;

        private CloudGameR_DBDataContext CGameR;

        private bool usernameOk;

        public NewUser(CloudGameR_DBDataContext CGameR)
        {
            InitializeComponent();
            this.CGameR = CGameR;

            UserData = new UserDataSet();
            taUser = new UserDataSetTableAdapters.UtilizadorTableAdapter();
            taUserManager = new UserDataSetTableAdapters.TableAdapterManager();


            CountryData = new CountryDataSet();
            taPais = new CountryDataSetTableAdapters.PaisTableAdapter();
            taManager = new CountryDataSetTableAdapters.TableAdapterManager();

            usernameOk = false;

        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                taPais.Fill(CountryData.Pais);
                taManager.PaisTableAdapter = taPais;

                imgUsernameOk.Visibility = Visibility.Hidden;

                DataContext = CountryData.Pais;

                country_comboBox.ItemsSource = CountryData.Pais.ToList();
                View = (CollectionView)CollectionViewSource.GetDefaultView(CountryData.Pais);

                var item = View.CurrentItem;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
                this.Close();
            }
        }

        private void userName_textBox_LostFocus(object sender, RoutedEventArgs e)
        {
            usernameCheck();
        }


        private void country_comboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

            View.MoveCurrentToPosition(country_comboBox.SelectedIndex);
        }

        private void btn_save_Click(object sender, RoutedEventArgs e)
        {
            #region FieldChecks
            if (!fieldCheck())
            {
                MessageBox.Show("Please fill in the username and password fields.", "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            //check username
            if (!usernameOk)
            {
                MessageBox.Show("Please change your username.", "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            #endregion

            try
            {
                int userID = CGameR.Utilizadors.Select(s => s.User_ID).Max() + 1;
                CountryDataSet.PaisRow pais = (CountryDataSet.PaisRow)country_comboBox.SelectedItem;

                int result = taUser.Insert(
                                    userID,
                                    userName_textBox.Text,
                                    passwordBox.Password,
                                    nome_textBox.Text,
                                    morada_textBox.Text,
                                    "ref_user" + userID,
                                    pais.Pais_ID);

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message, "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            finally
            {
                this.Close();
            }

        }

        #region FieldChecks_Methods
        /// <summary>
        /// Checks if Username and Password fields are null or empty.
        /// </summary>
        /// <returns>True if both fields have information.</returns>
        private bool fieldCheck()
        {
            if (String.IsNullOrEmpty(userName_textBox.Text))
                return false;
            if (String.IsNullOrEmpty(passwordBox.Password))
                return false;

            return true;
        }


        private void usernameCheck()
        {
            imgUsernameOk.Visibility = Visibility.Visible;
            if (!String.IsNullOrEmpty(userName_textBox.Text) &&
                usernameCheckCount() == 0)
            {
                imgUsernameOk.Source = VerificationImages.ApprovalImg;
                usernameOk = true;
            }
            else
            {
                imgUsernameOk.Source = VerificationImages.DisapprovalImg;
                usernameOk = false;
            }
        }

        private int usernameCheckCount()
        {
            try
            {
                return CGameR.Utilizadors
                            .Where(s => s.Username == userName_textBox.Text)
                            .Count();
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message, "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
                this.Close();
            }

            return -1;
        }


        #endregion

        new private void Close()
        {

            UserData = null;
            taUser = null;
            taUserManager = null;


            CountryData = null;
            taPais = null;
            taManager = null;

            base.Close();
        }


    }
}
