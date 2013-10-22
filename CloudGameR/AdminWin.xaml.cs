using System;
using System.Linq;
using System.Windows;

namespace CloudGameR
{
    /// <summary>
    /// Interaction logic for AdminWin.xaml
    /// </summary>
    public partial class AdminWin : Window
    {
        private CloudGameR_DBDataContext CGameR;

        private ContactTypeDataSetTableAdapters.TipoContactoTableAdapter taContactType;
        private UserDataSetTableAdapters.UtilizadorTableAdapter taUser;

        private bool contactTypeAddOk = false;
        private bool contactTypeRemOk = false;

        private bool userRemOk = false;
        private bool userChangeOk = false;

        public AdminWin(CloudGameR_DBDataContext CGameR)
        {
            this.CGameR = CGameR;


            taContactType = new ContactTypeDataSetTableAdapters.TipoContactoTableAdapter();
            taUser = new UserDataSetTableAdapters.UtilizadorTableAdapter();


            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            imgContactTypeOk.Visibility = Visibility.Hidden;
            imgRemContactOk.Visibility = Visibility.Hidden;
            imgRemUserOk.Visibility = Visibility.Hidden;
            imgChangeOk.Visibility = Visibility.Hidden;

        }
        private void tabUsers_LostFocus(object sender, RoutedEventArgs e)
        {

            statStatus.Text = "";
        }

        private void btnContact_Click(object sender, RoutedEventArgs e)
        {
            #region FieldChecks
            if (!contactTypefieldCheck())
            {
                MessageBox.Show("Please fill in the fields.", "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            //check username
            if (!contactTypeAddOk)
            {
                MessageBox.Show("Please change the contact type.", "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            #endregion

            try
            {
                int contactTypeID = CGameR.TipoContactos.Select(s => s.TipoContacto_ID).Max() + 1;


                int result = taContactType.Insert(
                                    contactTypeID,
                                    txtAddContact.Text);

                statStatus.Text = "New contact typed added successfuly!";
                imgContactTypeOk.Visibility = Visibility.Hidden;
                txtAddContact.Text = "";

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message, "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }

        private void txtAddContact_LostFocus(object sender, RoutedEventArgs e)
        {
            contactTypeCheck();
        }

        private void btnRemContactType_Click(object sender, RoutedEventArgs e)
        {
            #region FieldChecks
            if (!contactTypeRemfieldCheck())
            {
                MessageBox.Show("Please fill in the fields.", "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            //check username
            if (!contactTypeRemOk)
            {
                MessageBox.Show("Please change the contact type.", "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            #endregion

            try
            {



                int contactTypeID = CGameR.TipoContactos
                                            .Where(s => s.Descricao == txtRemContact.Text)
                                            .Select(s => s.TipoContacto_ID).Max(); //martelada



                int result = taContactType.Delete(
                                    contactTypeID,
                                    txtRemContact.Text);

                statStatus.Text = "Contact typed removed successfuly!";
                imgRemContactOk.Visibility = Visibility.Hidden;
                txtRemContact.Text = "";

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message, "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void txtRemContact_LostFocus(object sender, RoutedEventArgs e)
        {
            contactTypeRemCheck();
        }
        #region ContactType_Methods
        private bool contactTypefieldCheck()
        {
            if (String.IsNullOrEmpty(txtAddContact.Text))
                return false;

            return true;
        }

        private bool contactTypeRemfieldCheck()
        {
            if (String.IsNullOrEmpty(txtRemContact.Text))
                return false;

            return true;
        }

        private void contactTypeCheck()
        {
            if (!String.IsNullOrEmpty(txtAddContact.Text))
            {
                imgContactTypeOk.Visibility = Visibility.Visible;
                if (contactTypeCount() == 0)
                {
                    imgContactTypeOk.Source = VerificationImages.ApprovalImg;
                    contactTypeAddOk = true;
                }
                else
                {
                    imgContactTypeOk.Source = VerificationImages.DisapprovalImg;
                    contactTypeAddOk = false;
                }
            }
        }

        private void contactTypeRemCheck()
        {
            if (!String.IsNullOrEmpty(txtRemContact.Text))
            {
                imgRemContactOk.Visibility = Visibility.Visible;
                if (contactTypeRemCount() > 0)
                {

                    imgRemContactOk.Source = VerificationImages.ApprovalImg;
                    contactTypeRemOk = true;
                }
                else
                {
                    imgRemContactOk.Source = VerificationImages.DisapprovalImg;
                    contactTypeRemOk = false;
                }
            }
        }

        private int contactTypeCount()
        {
            try
            {

                return CGameR.TipoContactos
                            .Where(s => s.Descricao == txtAddContact.Text)
                            .Count();
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message, "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
                this.Close();
            }

            return -1;
        }

        private int contactTypeRemCount()
        {
            try
            {

                return CGameR.TipoContactos
                            .Where(s => s.Descricao == txtRemContact.Text)
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







        private void btnRemUser_Click(object sender, RoutedEventArgs e)
        {
            #region FieldChecks
            if (!userRemFieldCheck())
            {
                MessageBox.Show("Please fill in the fields.", "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            //check username
            if (!userRemOk)
            {
                MessageBox.Show("Please change the contact type.", "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            #endregion

            try
            {



                Utilizador user = CGameR.Utilizadors
                                            .Where(s => s.Username == txtRemUser.Text)
                                            .First();


                int result = taUser.Delete(
                                    user.User_ID,
                                    txtRemUser.Text,
                                    user.Pass,
                                    user.Nome,
                                    user.Morada,
                                    user.Referral,
                                    user.Pais_ID);


                statStatus.Text = "User removed successfuly!";
                imgRemUserOk.Visibility = Visibility.Hidden;
                txtRemUser.Text = "";

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message, "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        private void txtRemUser_LostFocus(object sender, RoutedEventArgs e)
        {
            userRemCheck();
        }


        private void btnChangeUsername_Click(object sender, RoutedEventArgs e)
        {
            #region FieldChecks
            if (!usernameChangeFieldCheck())
            {
                MessageBox.Show("Please fill in the fields.", "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            //check username
            if (!userChangeOk)
            {
                MessageBox.Show("Please change the contact type.", "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (newUsernameCount() != 0)
            {
                MessageBox.Show("New username is not available.", "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            #endregion

            try
            {
                Utilizador user = CGameR.Utilizadors
                                          .Where(s => s.Username == txtOldUsername.Text)
                                          .First();


                int result = taUser.Update(
                                        txtNewUsername.Text,
                                        user.Pass,
                                        user.Nome,
                                        user.Morada,
                                        user.Referral,
                                        user.Pais_ID,
                                        user.User_ID,
                                        user.Username,
                                        user.Pass,
                                        user.Nome,
                                        user.Morada,
                                        user.Referral,
                                        user.Pais_ID);

                statStatus.Text = "Username changed successfuly!";
                imgChangeOk.Visibility = Visibility.Hidden;
                txtOldUsername.Text = "";
                txtNewUsername.Text = "";

            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message, "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void txtOldUsername_LostFocus(object sender, RoutedEventArgs e)
        {
            usernameChangeCheck();
        }




        #region UserRemove_And_UsernameChange_Methods
        private bool userRemFieldCheck()
        {
            if (String.IsNullOrEmpty(txtRemUser.Text))
                return false;

            return true;
        }

        private bool usernameChangeFieldCheck()
        {
            if (String.IsNullOrEmpty(txtOldUsername.Text))
                return false;

            if (String.IsNullOrEmpty(txtNewUsername.Text))
                return false;

            return true;
        }


        private void userRemCheck()
        {
            if (!String.IsNullOrEmpty(txtRemUser.Text))
            {
                imgRemUserOk.Visibility = Visibility.Visible;
                if (userRemCount() > 0)
                {
                    imgRemUserOk.Source = VerificationImages.ApprovalImg;
                    userRemOk = true;
                }
                else
                {
                    imgRemUserOk.Source = VerificationImages.DisapprovalImg;
                    userRemOk = false;
                }
            }
        }

        private void usernameChangeCheck()
        {
            if (!String.IsNullOrEmpty(txtOldUsername.Text))
            {
                imgChangeOk.Visibility = Visibility.Visible;
                if (usernameCount() > 0)
                {

                    imgChangeOk.Source = VerificationImages.ApprovalImg;
                    userChangeOk = true;
                }
                else
                {
                    imgChangeOk.Source = VerificationImages.DisapprovalImg;
                    userChangeOk = false;
                }
            }
        }



        private int userRemCount()
        {
            try
            {

                return CGameR.Utilizadors
                            .Where(s => s.Username == txtRemUser.Text)
                            .Count();
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message, "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
                this.Close();
            }

            return -1;
        }

        private int usernameCount()
        {
            try
            {

                return CGameR.Utilizadors
                            .Where(s => s.Username == txtOldUsername.Text)
                            .Count();
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message, "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
                this.Close();
            }

            return -1;
        }

        private int newUsernameCount()
        {
            try
            {

                return CGameR.Utilizadors
                            .Where(s => s.Username == txtNewUsername.Text)
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





    }
}
