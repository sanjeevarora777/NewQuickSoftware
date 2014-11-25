<%@ Page Title="" Language="C#" MasterPageFile="~/StoreMain.Master" AutoEventWireup="true" CodeBehind="frmReleaseNote.aspx.cs" Inherits="QuickWeb.New_Admin.frmReleaseNote" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">   
    <link href="../css/styles.css" rel="stylesheet" type="text/css" />
    <script src="../js/main.js" type="text/javascript"></script>
    <style type="text/css">
        #cssmenu > ul > li:first-child:hover
        {
            background: #f5f5f5;
            background: -moz-linear-gradient(#f5f5f5 0%, #f5f5f5 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #f5f5f5), color-stop(100%, #f5f5f5));
            background: -webkit-linear-gradient(#f5f5f5 0%, #f5f5f5 100%);
            background: linear-gradient(#f5f5f5 0%, #f5f5f5 100%);
        }
        #cssmenu > ul > li
        {
            background: #f5f5f5;
            background: -moz-linear-gradient(#f5f5f5 0%, #f5f5f5 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #f5f5f5), color-stop(100%, #f5f5f5));
            background: -webkit-linear-gradient(#f5f5f5 0%, #f5f5f5 100%);
            background: linear-gradient(#f5f5f5 0%, #f5f5f5 100%);
        }
        #cssmenu > ul > li:hover
        {
            background: #f5f5f5;
            background: -moz-linear-gradient(#f5f5f5 0%, #f5f5f5 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #f5f5f5), color-stop(100%, #f5f5f5));
            background: -webkit-linear-gradient(#f5f5f5 0%, #f5f5f5 100%);
            background: linear-gradient(#f5f5f5 0%, #f5f5f5 100%);
        }
        .table
        {
            margin-bottom: 0px;
        }
        .td5
        {
            padding-left: 8px;
            padding-top: 5px;
            line-height: 1.5;
        }
        .td6
        {
            padding-top: 9px;
            line-height: 1.5;
        }
        
        .bulletColor
        {
            font-size: 10px;
            color: gray;
        }
        
        #cssmenu > ul > li.has-sub > a span
        {
            background: url("../images/icon_plus-black.png") no-repeat scroll 96% center rgba(0, 0, 0, 0);
        }
        #cssmenu > ul > li.has-sub.active > a span
        {
            background: url("../images/icon_minus-black.png") no-repeat scroll 96% center rgba(0, 0, 0, 0);
        }
        #spnMenu,#spnLogPage
        {
            cursor: pointer;
        }
    </style>
    <script src="../JavaScript/javascript.js" type="text/javascript"></script>
    <script src="../js/jquery-ui-1.8.23.custom.min.js" type="text/javascript"></script>
    <script src="../js/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row-fluid div-margin">
        <div class="col-sm-12">
            <div class="panel panel-primary well-sm-tiny1">
                <div class="panel-body">
                    <div class="row-fluid div-margin">
                        <div id='cssmenu' class="col-sm-12">
                            <ul>
                                <li></li>
                                <li><a class="testMenu" href=''><span style="color: #6e6e6e"><i class="fa fa-list fa-lg">
                                </i>&nbsp;&nbsp;Release 14.11.5.4</span></a>
                                    <ul style="padding: 12px 10px 10px 12px" id="rel54">
                                        <table>
                                            <tr class="div-margin">
                                                <td class="td6">
                                                    <i class="fa fa-circle bulletColor"></i>
                                                </td>
                                                <td class="td5">
                                                    Support section - A new section introduced for Remote support, tutorials and How
                                                    to use tours to enable seamless support.
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td6">
                                                    <i class="fa fa-circle bulletColor"></i>
                                                </td>
                                                <td class="td5">
                                                    Remote Support Integration: Remote support system is now inbuilt in Quick Dry Cleaning
                                                    Software’s Support section. Our support team is just a click away from you.
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td6">
                                                    <i class="fa fa-circle bulletColor"></i>
                                                </td>
                                                <td class="td5">
                                                    Automated license renewal - You will get timely reminders to renew your license
                                                    to help avoid last minute confusions and interruption in software service.
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td6">
                                                    <i class="fa fa-circle bulletColor"></i>
                                                </td>
                                                <td class="td5">
                                                    Menu Rearrangement – We have re arranged all menu items to make it more intuitive
                                                    to use. <span id="spnMenu" style="color: #428bdc">Learn what's moved where.</span>
                                                </td>
                                            </tr>
                                        </table>
                                    </ul>
                                </li>
                                <li><a class="testMenu" href=''><span style="color: #6e6e6e"><i class="fa fa-list fa-lg">
                                </i>&nbsp;&nbsp;Release 14.11.5.3</span></a>
                                    <ul style="padding: 12px 5px 10px 15px" id="rel53">
                                        <table>
                                            <tr class="div-margin">
                                                <td class="td6">
                                                    <i class="fa fa-circle bulletColor"></i>
                                                </td>
                                                <td class="td5">
                                                    A new membership plan by which any customer can pay a fixed amount as advance and
                                                    enjoy great benefits.
                                                    <br />
                                                    <b>Sample:</b>
                                                    <br />
                                                    Membership Cost/Customer pays: 10000
                                                    <br />
                                                    Benefit value that customer gets: 12000
                                                    <br />
                                                    Validity: One Year
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td6">
                                                    <i class="fa fa-circle bulletColor"></i>
                                                </td>
                                                <td class="td5">
                                                    Store operation timing feature: once activated it will allow login only at specified
                                                    business hours only. The administrator will have unrestricted access to the system
                                                    at all time.
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td6">
                                                    <i class="fa fa-circle bulletColor"></i>
                                                </td>
                                                <td class="td5">

                                                <span id="spnLogPage" style="color:#428bdc">Order log: </span>
                                                   A new Report which keeps track of every action performed on an order,
                                                    keeping tab on how many time invoice is opened and edited.
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td6">
                                                    <i class="fa fa-circle bulletColor"></i>
                                                </td>
                                                <td class="td5">
                                                    Login History: A report which keeps track of all login activity, success or failure
                                                    both and registers reason for failure.
                                                    <br />
                                                    <b>Sample:</b><br />
                                                    Incorrect ID<br />
                                                    Incorrect Password<br />
                                                    Tried to login after Store Timings<br />
                                                    Tried to login on Weekly Off.<br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td6">
                                                    <i class="fa fa-circle bulletColor"></i>
                                                </td>
                                                <td class="td5">
                                                    Multiple Payment & Delivery Report two new filters added
                                                    <br />
                                                    <b>Outstanding Garment Only:</b> It will show all orders which are fully paid, but
                                                    garments are not yet delivered.
                                                    <br />
                                                    <b>Outstanding Payment Only:</b> It will show all orders for which garments are
                                                    delivered but payment is still pending.
                                                </td>
                                            </tr>
                                        </table>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:HiddenField ID="hdnReleaseCheck" Value="0" runat="server" ClientIDMode="Static" />
    </div>
    <script type="text/javascript" language="javascript">
        $(document).ready(function () {
            $('.testMenu').click(function () {
                var myVar1 = setInterval(function () { SetFocusSize() }, 300);
                function SetFocusSize() {
                    var height1 = document.body.clientHeight;
                    height1 = height1 + 'px';
                    $("#tdheight").css("height", height1);
                    $(".nav_new").css("height", height1);
                    clearInterval(myVar1);
                    return false;
                }
            });
            if ($('#hdnReleaseCheck').val() == "1") {
                $('#rel54').css('display', 'block');
            }
            else if ($('#hdnReleaseCheck').val() == "2") {
                $('#rel53').css('display', 'block');
            }
            $('#spnMenu').click(function () {
                window.open('../Docs/Menu_Changes.jpg', '_blank'); return false;
            });

            $('#spnLogPage').click(function () {
                window.open('../New_Admin/frmBookingHistory.aspx', '_blank'); return false;
            });
        });
    </script>
</asp:Content>
