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
    public partial class User : Window
    {
        private void LoadSettings(string username)
        {
            try
            {
                var paises = from p in CGameR.Pais
                             select new
                             {
                                 p.Nome,
                                 p.Pais_ID,
                             };
                this.cmbCountry.ItemsSource = paises.ToList();

                var users = from u in CGameR.Utilizadors
                            where u.Username.ToLower() == username.ToLower()
                            select new
                            {
                                UserName = u.Username,
                                Name = u.Nome,
                                Address = u.Morada,
                                CountryID = u.Pais_ID,
                                Password = u.Pass,
                            };

                if (users.Count() > 0)
                {
                    var user = users.ToList()[0];
                    this.lblUserNick.Content = user.UserName;
                    this.lblUserName.Content = user.Name;
                    this.txtAddress.Text = user.Address;
                    this.cmbCountry.SelectedValue = user.CountryID;

                    this.txtCurrent.Password = user.Password;
                }

                CloudGameR.UserDataSetTableAdapters.UtilizadorTableAdapter taUser = new UserDataSetTableAdapters.UtilizadorTableAdapter();
                var jogos = from jogo in CGameR.Jogos
                            where jogo.Nome == taUser.GetMostPlayedGameBy(username)
                            select new
                            {
                                Name = jogo.Nome,
                                Genre = jogo.Genero,
                                Picture = jogo.Capa_Endereco,
                                ReleaseDate = jogo.Data_Lancamento,
                            };

                if (jogos.Count() > 0)
                {
                    var jogo = jogos.ToList()[0];
                    this.grFavoriteGame.GameName = jogo.Name;
                    this.grFavoriteGame.GameGenre = jogo.Genre.Genero1;
                    this.grFavoriteGame.GamePicture = jogo.Picture;
                    this.grFavoriteGame.GameReleaseDate = jogo.ReleaseDate;
                }

                this.lblNumerOfGames.Content = taUser.GetNumGamesOf(username);
                this.lblTotalHoursPlayed.Content = taUser.GetTotalHorasPlayedBy(username);

                taUser.Dispose();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), Title + " - Loading User Settings.", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnSaveChanges_Click(object sender, RoutedEventArgs e)
        {
            if (!CanSave())
                return;

            try
            {
                var user = (from u in CGameR.Utilizadors
                            where u.Username == CurrentUserName
                            select u).First();
                user.Morada = this.txtAddress.Text;
                user.Pais_ID = (int)this.cmbCountry.SelectedValue;
                user.Pass = this.txtNew.Password;
                CGameR.SubmitChanges();

                MessageBox.Show("User data successfully saved.", "Changes Saved", MessageBoxButton.OK, MessageBoxImage.None);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), Title + " - Saving Changes.", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private bool CanSave()
        {
            if (String.IsNullOrEmpty(this.txtCurrent.Password) ||
                String.IsNullOrEmpty(this.txtNew.Password) ||
                String.IsNullOrEmpty(this.txtConfirm.Password))
            {
                MessageBox.Show("The password fields cannot be empty.", "Invalid password value.", MessageBoxButton.OK, MessageBoxImage.Warning);
                return false;
            }

            if (CGameR.Utilizadors.Where(u => u.Username == CurrentUserName && u.Pass == this.txtCurrent.Password).Count() == 0)
            {
                MessageBox.Show("The specified current password does not match with the present one.", "Password does not match.", MessageBoxButton.OK, MessageBoxImage.Warning);
                return false;
            }

            if (this.txtNew.Password != this.txtConfirm.Password)
            {
                MessageBox.Show("The new password does not match.", "Password not matching.", MessageBoxButton.OK, MessageBoxImage.Warning);
                return false;
            }

            return true;
        }
    }
}