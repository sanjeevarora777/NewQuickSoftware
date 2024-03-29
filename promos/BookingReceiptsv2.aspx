﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingReceiptsv2.aspx.cs" Inherits="promos.BookingReceiptsv2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="Stylesheet" href="css/bookingreceiptsv2.css" />
    <script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
    <script type="text/javascript" src="js/bookingReceiptsv2.js"></script>
    <link href="css/jquery.datepick.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery.datepick.js" type="text/javascript"></script>
    <title>Book Receipts</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="mainContainer">
        <div id="leftContainer">
            <div id="bookingType">
                <div id="receiptNo">
                    Booking #<span>001</span>
                </div>
                <div id="walkIn" class="button" radioGroup="bookingType">
                    Walkin
                </div>
                <div id="home" class="button" radioGroup="bookingType">
                    Home
                </div>
                <div id="homeDeliveryReceipt">
                    Home Recipt #
                </div>
            </div>
            <div id="customerData">
                <div id="customerDetails">
                    <span>Customer Name:</span>
                    <input type="text" value="" />
                </div>
                <div id="customerPriorities">
                    <span>Priorities:</span>
                    <input type="text" value="" />
                </div>
                <div id="customerRemarks">
                    <span>Remarks:</span>
                    <input type="text" value="" />
                </div>

            </div>
            <div id="bookingTable">
                <table cellpadding="0" cellspacing="0" border="1">
                    <thead>
                        <tr>
                            <th class="col1">#</th>
                            <th class="col2">Qty</th>
                            <th class="col3">Description</th>
                            <th class="col4">Process</th>
                            <th class="col5">Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <div id="totals">
            <div id="receiptTotals">
                <div id="totalLabels">
                    <div><label for="txtGross">Gross:</label></div>
                    <div><label for="txtDiscount">Discount:</label></div>
                    <div><label for="txtTax">Tax:</label></div>
                    <div><label for="txtBalance">Balance:</label></div>
                    <div><label for="txtAdvance">Advance:</label></div>
                    <div><label for="txtNetTotal">Net Total:</label></div>
                </div>
                <div id="totalAmount">
                    <input type="text" id="txtGross" value="" readonly="readonly"/>
                    <input type="text" id="txtDiscount" value="" maxlength="5" rel="numPad" showNumPad="right" />
                    <input type="text" id="txtTax" value="" />
                    <input type="text" id="txtBalance" value="" />
                    <input type="text" id="txtAdvance" value="" maxlength="5"  rel="numPad" showNumPad="right" />
                    <input type="text" id="txtNetTotal" value="" readonly="readonly" />
                </div>
            </div>
            <div id="deliveryDetails">
                    <div id="dueDetails">
                        <div id="dueDate">
                            <label for="txtDueDate">Due Date:</label>
                            <input type="text" id="txtDueDate" value="" />
                        </div>
                        <div id="dueTime">
                            <label for="txtDueTime">Due Time:</label>
                            <input type="text" id="txtDueTime" value="" />
                        </div>
                    </div>
                    <div id="dueButtons">
                        <div id="urgent" class="button" radioGroup="urgent">Urgent</div>
                        <div id="sms" class="button" radioGroup="sms">SMS</div>
                        <div id="email" class="button" radioGroup="email">Email</div>
                    </div>
                    <div id="remarks">
                        <div id="remarksLabel"><label for="txtRemarks">Remarks</label></div>
                        <div id="remarksControl"><input type="text" id="Text1" /></div>
                    </div>
                    <div id="bookingPersonDetails">
                        <div id="bokkingSalesman">
                            <label for="drpSalesman">Salesman</label>
                            <select id="drpSalesman">
                                <option selected="selected"></option>
                            </select>
                        </div>
                        <div id="checkedBy">
                            <label for="drpCheckedBy">Checked By</label>
                            <select id="drpCheckedBy">
                                <option selected="selected"></option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div id="leftCommands">
                <div id="submit">
                    <input type="button" id="btnSubmit" value="Submit" />
                </div>
                <div id="submitAndPrint">
                    <input type="button" id="btnSubmitPrint" value="Submit &amp; Print" />
                </div>
            </div>
        </div>
        <div id="rightContainer">
            <div id="itemsPanel">
                <%--<div id="itemCategories">
                    <div><span>Men</span></div>
                    <div><span>Women</span></div>
                    <div><span>Kids</span></div>
                    <div><span>Household</span></div>
                    <div><span>Others</span></div>
                </div>--%>
                <div id="catItems"></div>
<%--                <div id="itemDesc">
                    <div id="qty">
                        <label for="txtQuantity">Qty</label>
                        <input type="text" id="txtQuantity"  maxlength="5" value="1" rel="numPad" showNumPad="bottom" createRow="true" />
                    </div>
                    <div id="brand">
                        <label for="txtBrand">Brand</label><input type="text" id="txtBrand" />
                    </div>
                    <div id="itemRemarks">
                        <label for="txtItemRemarks">Remarks</label><input type="text" id="txtItemRemarks" />
                    </div>
                </div>--%>
            </div>
            <div id="miscPanel">
                <div id="subItemsContainer" class="container3">
                    <%--<div class="noScrollLeft"></div>--%>
                    <div id="subItemsHeader" class="header">
                        <div id="subItemsDetail" class="detail">
                            <span class="watermark">Sub Items</span>
                        </div>
                    </div>
                    <%--<div class="noScrollRight"></div>--%>
                </div>
                <div id="variationsContainer" class="container4">
                    <%--<div class="scrollLeft"></div>--%>
                    <div id="variationsHeader" class="header">
                        <div id="variationsDetail" class="detail">
                            <span class="watermark">Variations</span>
                        </div>
                        <div id="allVariations"></div>
                    </div>
                    <%--<div class="noScrollRight"></div>--%>
                </div>
                <div id="quantityContainer" class="container1">
                    <ul>
                        <li class="quantityLabel">Quantity</li>
                        <li id="quantityText" class="quantityText" maxlength="5" rel="numPad" showNumPad="right" >1</li>
                    </ul>
                </div>
                <div id="categoriesContainer" class="container2">
                    <%--<div class="noScrollLeft"></div>--%>
                    <div id="categoriesHeader" class="header">
                        <div id="categoriesDetail" class="detail">
                            <span class="watermark">Categories</span>
                        </div>
                        <div id="allCategories"></div>
                    </div>
                    <%--<div class="noScrollRight"></div>--%>
                </div>
                <div id="colorsContainer" class="container5" title="Click to select colors" flyoutDiv="colorsPanel">
                    <%--<div class="flyout"></div>--%>
                    <div id="colorsIcon" class="iconContainer">Colors & Patterns
                    </div>
                    <div id="colorsPanel" rel="panel">
                        <div id="colors">
                        </div>
                        <hr />
                        <div id="patterns"></div>
                    </div>
                </div>
                <div id="brandsContainer" class="container5" title="Brands" flyoutDiv="brandsPanel">
                    <%--<div class="flyout"></div>--%>
                    <div id="brandsIcon" class="iconContainer">Brands</div>
                    <div id="brandsPanel" rel="panel">
                        <div id="brands"></div>
                    </div>
                </div>
                <div id="commentsContainer" class="container5" title="Comments" flyoutDiv="commentsPanel">
                    <%--<div class="flyout"></div>--%>
                    <div id="commentsIcon" class="iconContainer">Remarks</div>
                    <div id="commentsPanel" rel="panel">
                        <div id="comments"></div>
                    </div>
                </div>
            </div>
            <div id="processContainer">
                <div id="processPanel">
                    <div class="noScrollLeft"></div>
                    <div id="processes">
                    </div>
                    <div class="noScrollRight"></div>
                    <div id="processDesc">
                        <div id="processDescItems">
                        </div>
                    </div>
                </div>
            </div>
            <div id="rightCommands">
                <div id="new"><input type="button" id="btnNew" value="Add New Item" /></div>
                <div id="delete"><input type="button" id="btnDelete" value="Delete" /></div>
            </div>        
        </div>
        <div id="tooltipDiv">
        </div>
        <div id="numPad">
        </div>
        <div id="lineItemXmls">
            <div id="lineItemTemplate"></div>
            <div id="lineItems"></div>
            <div id="test"></div>
        </div>
        <div id="processData" current="1">
            
        </div>
        <div id="feedbackHeader">
            <span>Feedback...</span>
            <div id="feedbackDetail">
                <label for="txtName">Name(*)</label><br />
                <input type="text" id="txtName" /><br /><br />
                <label for="txtFeedback">Feedback(*)</label><br />
                <textarea id="txtFeedback" rows="10" cols="80"></textarea><br /> <br />
                <input type="button" id="btnFeedback" value="Submit Feedback" />
                <input type="button" id="btnClose" value="Close" />
            </div>
        </div>
    </div>

    </form>
</body>
</html>
