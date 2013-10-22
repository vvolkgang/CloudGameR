using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace CloudGameR
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private static string ADMIN_PASS = "admin";
        private CloudGameR_DBDataContext CGameR;

        public MainWindow()
        {
            InitializeComponent();
            CGameR = new CloudGameR_DBDataContext();

            //    listBox1.ItemsSource = query;

            //    foreach (var user in query)
            //    {
            //        Console.WriteLine("Nome> {0}\tPass> {1}", user.Nome, user.Pass);
            //    }
        }

        private void newUser_MouseUp(object sender, RoutedEventArgs e)
        {
            NewUser window = new NewUser(CGameR);
            window.ShowDialog();

            window = null;
        }

        private void login_button_Click(object sender, RoutedEventArgs e)
        {
            if (username_textBox.Text.ToLower() == "admin")

                checkAdminLogin();
            else
                checkUserLogin();
        }

        #region loginButton_methods
        private void checkUserLogin()
        {


            //var users = from u in cgr.Utilizadors
            //            where u.Username == username_textBox.Text
            //                && u.Pass == passwordBox.Password
            //            select u;

            var users = CGameR.Utilizadors.Where(
                            u =>
                            u.Username == username_textBox.Text
                            && u.Pass == passwordBox.Password);

            if (users.Count() == 1)
            {
                User user = new User(username_textBox.Text, CGameR);
                user.Show();

                CGameR = null;
                users = null;
                this.Close();
            }
            else
                loginError();

            users = null;
        }

        private void checkAdminLogin()
        {
            if (passwordBox.Password == ADMIN_PASS)
            {
                AdminWin admin = new AdminWin(CGameR);
                admin.Show();
                this.Close();
            }
            else
                loginError();

        }

        private void loginError()
        {
            string error = "Login failed. Your login details are either incorrect or could not be found.";
            MessageBox.Show(this, error, "Database Error", MessageBoxButton.OK, MessageBoxImage.Error);
        }
        #endregion

    }
}
