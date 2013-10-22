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
        private void LoadMyGames()
        {
            try
            {
                var jogos = from j in CGameR.Jogos
                            from a in CGameR.Aquisicaos
                            from u in CGameR.Utilizadors
                            where u.Username == CurrentUserName &&
                                  a.User_ID == u.User_ID &&
                                  j.Jogo_ID == a.Jogo_ID
                            select new
                            {
                                Name = j.Nome,
                                Genre = j.Genero,
                                Released = j.Data_Lancamento,
                                Picture = j.Capa_Endereco,
                                Editor = j.Editora.Nome,
                                Creator = j.Criadora.Nome,
                                Purchased = a.Factura.Data,
                                PurchasePrice = a.Custo_Total
                            };

                foreach (var jogo in jogos.OrderBy(j => j.Name))
                    this.MyGamesStackPanel.Children.Add(
                        new GameRow()
                        {
                            GameName = jogo.Name,
                            GameGenre = jogo.Genre.Genero1,
                            GamePicture = jogo.Picture,
                            GameReleaseDate = jogo.Released,
                            ShowPrice = true,
                            GamePrice = (float)jogo.PurchasePrice,
                            GameEditor = jogo.Editor,
                            GameCreator = jogo.Creator,
                            GamePurchased = jogo.Purchased,
                            ShowPurchaseDate = true
                        });
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString(), Title + " - Loading My Games list.", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}