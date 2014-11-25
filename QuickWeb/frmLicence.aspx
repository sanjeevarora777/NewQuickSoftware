<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLicence.aspx.cs" Inherits="QuickWeb.frmLicence" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="Shortcut Icon" type="image/ico" href="images/favicon.ico" />
    <title>
        <%=AppTitle %></title>
    <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap-extend.css" rel="stylesheet" type="text/css" />
    <link href="css/ace.min.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            function DisableBackButton() {
                window.history.forward();
            }
            setTimeout("DisableBackButton()", 0);
            window.onunload = function () { null };

            //            $('#btnContinue').click(function (e) {
            //                window.open('home.html', '_self');
            //                e.preventDefault();
            //            });

            $('#btnExit').click(function (e) {
                window.open('login.aspx', '_self');
                e.preventDefault();
            });


        });
    </script>
</head>
<body style="background-color: White">
    <form id="form1" runat="server">
    <div>
        <div class="row-fluid">
            <br />
            <br />
            <br />
            <div class="col-sm-1">
            </div>
            <div class="col-sm-10">
                <div class="well">
                    <h1 class="grey lighter smaller">
                        <span class="blue bigger-125">
                            <img class="img-rounded" height="75px" width="75px" src="img/LogoBIG.png"></span>&nbsp;It's
                        Time to Renew your software License
                    </h1>
                    <hr>
                    <div>
                        <h4 class="lighter smaller">
                            We hope you are enjoying using Quick Dry Cleaning Software and it is helping you
                            manage your business efficiently. This is to bring to your notice that your annual
                            subscription to use this software is getting expired on
                            <asp:Label ID="lblRenewalDate" Font-Bold="true" runat="server" ClientIDMode="Static"></asp:Label>.</h4>
                        <ul class="list-unstyled spaced inline bigger-110 margin-15">
                            <li style="font-size: large"><i class="ace-icon fa fa-hand-o-right blue"></i>&nbsp;You
                                can continue to take benefits of the software and our support services by paying
                                up for your subscription for next year. </li>
                            <li style="font-size: large"><i class="ace-icon fa fa-hand-o-right blue"></i>&nbsp;Hurry
                                only <b>
                                    <asp:Label ID="lblDay" runat="server" Font-Bold="true" ClientIDMode="Static"></asp:Label>
                                    days </b>left, your renewal amount is
                                <asp:Label ID="lblAmount" runat="server" Font-Bold="true" ClientIDMode="Static"></asp:Label>
                                <asp:Label ID="lblCurrency" runat="server" Font-Bold="true" ClientIDMode="Static"></asp:Label>
                                . </li>
                        </ul>
                    </div>
                    <hr style="margin: 0px" />
                    <div class="row-fluid div-margin" style="height: 45px">
                        <div class="col-sm-4">
                            <asp:LinkButton ID="btnExit" class="fa-lg" EnableTheming="false" runat="server" ClientIDMode="Static"><i class="fa fa-arrow-circle-o-left fa-lg"></i>&nbsp;Exit</asp:LinkButton>
                        </div>
                        <div class="col-sm-4 text-center">
                            <a class="btn btn-success btn-lg" href="http://www.quickdrycleaning.com/payonline/" target="_blank">Pay Now</a>
                        </div>
                        <div class="col-sm-4">
                            <asp:LinkButton ID="btnContinue" class="fa-lg pull-right" EnableTheming="false" runat="server"
                                ClientIDMode="Static" OnClick="btnContinue_Click">I will pay later&nbsp;<i class="fa fa-arrow-circle-o-right fa-lg"></i></asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
