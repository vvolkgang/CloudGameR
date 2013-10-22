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
using System.Windows.Shapes;
using System.Drawing;

namespace CloudGameR
{
    /// <summary>
    /// Interaction logic for User.xaml
    /// </summary>
    public partial class User : Window
    {
        private CloudGameR_DBDataContext CGameR;
        private string CurrentUserName { get; set; }

        public User(string name, CloudGameR_DBDataContext CGameR)
        {
            InitializeComponent();

            this.CGameR = CGameR;
            
            username_label.Content = "Welcome, " + name;

            CurrentUserName = name;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            LoadSettings(CurrentUserName);
            LoadMyGames();
            LoadNews(1000);
        }
    }
}
