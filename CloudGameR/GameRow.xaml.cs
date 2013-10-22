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
using System.Drawing;

namespace CloudGameR
{
    /// <summary>
    /// Interaction logic for GameRow.xaml
    /// </summary>
    public partial class GameRow : UserControl
    {
        private bool loaded = false;
        private System.Windows.Media.Brush originalBackground;

        public string GamePicture { get; set; }
        public string GameName { get; set; }
        public string GameGenre { get; set; }
        public string GameEditor { get; set; }
        public string GameCreator { get; set; }
        public DateTime GameReleaseDate { get; set; }
        public float GamePrice { get; set; }
        public bool ShowPrice { get; set; }
        public bool ShowPurchaseDate { get; set; }
        public DateTime GamePurchased { get; set; }


        public GameRow()
        {
            InitializeComponent();

            this.GameGenre = "N/A";
            this.GameName = "N/A";
            this.GameReleaseDate = DateTime.MinValue;
            this.GamePurchased = DateTime.MinValue;
            this.ShowPrice = true;
        }

        private void UserControl_Loaded(object sender, RoutedEventArgs e)
        {
            SetData();
        }

        private void SetData()
        {
            if (loaded)
                return;

            this.originalBackground = this.Background;

            try
            {
                if (!string.IsNullOrEmpty(GamePicture)) this.imgPicture.Source = new BitmapImage(new Uri(GamePicture, UriKind.Relative));
                this.lblName.Content = GameName;
                this.lblInfo.Content = string.Format("{0} - Released: {1}", GameGenre, GameReleaseDate != DateTime.MinValue ? GameReleaseDate.ToString("dd MMM yyyy") : "N/A");
                this.lblEditorCreator.Content = string.Format("{0} - {1}", GameEditor, GameCreator);
                this.lblPrice.Content = GamePrice.ToString("0.00€");
                this.lblPurchased.Content = string.Format("Purchased: {0}", GamePurchased.ToString("dd MMM yyyy"));
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                //MessageBox.Show(ex.ToString(), "Game Row", MessageBoxButton.OK, MessageBoxImage.Error);
            }

            if (!ShowPrice)
                this.lblPrice.Visibility = Visibility.Hidden;

            if (!ShowPurchaseDate)
                this.lblPurchased.Visibility = Visibility.Hidden;

            loaded = true;
        }

        private void UserControl_MouseEnter(object sender, MouseEventArgs e)
        {
            this.Background = System.Windows.Media.Brushes.Gray;
            this.Cursor = Cursors.Hand;
        }

        private void UserControl_MouseLeave(object sender, MouseEventArgs e)
        {
            this.Background = originalBackground;
            this.Cursor = Cursors.Arrow;
        }
    }
}
