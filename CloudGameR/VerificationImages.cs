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
using System.Data;

namespace CloudGameR
{

    class VerificationImages
    {
        private static BitmapImage imgApproval;
        private static BitmapImage imgDisapproval;

        public static BitmapImage ApprovalImg { get { return imgApproval; } }
        public static BitmapImage DisapprovalImg { get { return imgDisapproval; } }
        
        static VerificationImages()
        {
            imgApproval = new BitmapImage(new Uri("pack://application:,,,/CloudGameR;component/Resources/approval_64.png"));
            imgDisapproval = new BitmapImage(new Uri("pack://application:,,,/CloudGameR;component/Resources/disapproval_64.png"));
        }
    }
} 
