<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Product List</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/customer_m.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="font/themify-icons/themify-icons.css">
        <link rel="stylesheet" href="css/review_m.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <body onload="time()" class="app sidebar-mini rtl">
                <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
                <aside class="app-sidebar">
                    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="https://thumbs.dreamstime.com/b/admin-sign-laptop-icon-stock-vector-166205404.jpg" width="50px"
                                                        alt="User Image">

                    </div>
                    <hr>
                    <ul class="app-menu">
                        <li><a class="app-menu__item" href="dashboard"><i class='app-menu__icon bx bx-tachometer'></i><span
                                    class="app-menu__label">Dashboard</span></a></li>
                        <li><a class="app-menu__item" href="customer_manage"><i class='app-menu__icon bx bx-user-voice'></i><span
                                    class="app-menu__label">Customers</span></a></li>
                        <li><a class="app-menu__item" href="product_manage"><i
                                    class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Products</span></a>
                        </li>
                        <li><a class="app-menu__item" href="order_manage"><i class='app-menu__icon bx bx-task'></i><span
                                    class="app-menu__label">Orders</span></a></li>
                        <li><a class="app-menu__item" href="review_manage"><i class='app-menu__icon bx bx-task'></i><span
                                    class="app-menu__label">Reviews</span></a></li>
                       
                        <button class="admin_logout" onclick="showLogoutBox()">Logout</button>
                        <div class="logout-box" id="logoutBox" style="display: none">
                            <h2>Logout</h2>
                            <p>Are you sure you want to logout?</p>
                            <button onclick="logout()">Logout</button>
                            <button onclick="cancelLogout()">Cancel</button>
                        </div>
                    </ul>
                </aside>
        </aside>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="#"><b>All Products</b></a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-md-4" style="display: flex; justify-content: flex-start; align-items: center;">
                                    <a class="btn btn-add btn-sm" href="product_manage?action=insert" title="Thêm">
                                        <i class="fas fa-plus"></i> Add Products
                                    </a>
                                </div>
                                <div class="col-md-4" style="display: flex; justify-content: center; align-items: center;">
                                    <!-- Button for sorting -->
                                    <button onclick="sortTableByPriceDescending()" class="btn btn-primary btn-sm">
                                        <i class="fas fa-sort-amount-down"></i> Sort by Price (Desc)
                                    </button>
                                </div>
                                <div class="col-md-4" style="display: flex; justify-content: flex-end; align-items: center;">
                                    <input type="text" id="searchInput" placeholder="Search by name.." style="margin-right: 5px;">
                                    <button onclick="searchBooksByName()" class="btn btn-primary btn-sm">
                                        <i class="ti-search"></i> Search
                                    </button>
                                </div>
                            </div>

                            <table class="table table-hover table-bordered" id="sampleTable">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Author</th>
                                        <th>Publisher</th>
                                        <th>Publisher Date</th>
                                        <th>Genres</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Details</th>
                                        <th>All Images</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${productList}" var="product">
                                        <tr>
                                            <td>${product.bookID}</td>
                                            <td>${product.bookName}</td>
                                            <td>${product.authorName}</td>
                                            <td>${product.publisherName}</td>
                                            <td>${product.publisherDate}</td>
                                            <td>
                                                <c:forEach items="${genreList}" var="genre" varStatus="loop">
                                                    <c:if test="${product.bookID==genre.bookID}">
                                                        ${genre.genreName} 
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td>${product.price}</td>
                                            <td>${product.quantity}</td>
                                            <td>${product.detailbook}</td>
                                            <td>
                                                <!-- Inside your forEach loop -->
                                                <button class="add-customer-btn" onclick="openPopup('${product.img_1}', '${product.img_2}', '${product.img_3}', '${product.img_4}')">Show images...</button>
                                                <div id="popup" class="popup">
                                                    <div class="popup-content">
                                                        <div class="row">
                                                            <div class="col-3">
                                                                <img id="img1" alt="Image 1" style="width: 90px; height: 90px;">
                                                                <p style="text-align: center;">Image 1</p>
                                                            </div>
                                                            <div class="col-3">
                                                                <img id="img2" alt="Image 2" style="width: 90px; height: 90px;">
                                                                <p style="text-align: center;">Image 2</p>
                                                            </div>
                                                            <div class="col-3">
                                                                <img id="img3" alt="Image 3" style="width: 90px; height: 90px;">
                                                                <p style="text-align: center;">Image 3</p>
                                                            </div>
                                                            <div class="col-3">
                                                                <img id="img4" alt="Image 4" style="width: 90px; height: 90px;">
                                                                <p style="text-align: center;">Image 4</p>
                                                            </div>
                                                        </div>
                                                        <div id="submit-type">
                                                            <button type="button" onclick="closePopup()">Close</button>
                                                        </div>
                                                    </div>
                                                </div>

                                            </td>

                                            <td>
                                                <button class="update-product-btn" onclick="showUpdateForm('${product.bookID}', '${product.bookName}', '${product.authorName}', '${product.publisherName}', '${product.publisherDate}', '${product.price}', '${product.quantity}', '${product.detailbook}', '${product.img_1}', '${product.img_2}', '${product.img_3}', '${product.img_4}')">Update</button>
                                                <form method="post" action="product_manage?action=updateproduct" style="display: none;" id="updateForm${product.bookID}">
                                                    <input type="hidden" name="action" value="updateproduct">
                                                    <input type="hidden" name="bookID" value="${product.bookID}">
                                                    Name: <input type="text" name="bookName" value="${product.bookName}"><br>
                                                    Author: <input type="text" name="authorName" value="${product.authorName}"><br>
                                                    Publisher: <input type="text" name="publisherName" value="${product.publisherName}"><br>
                                                    Publisher Date: <input type="text" name="publisherDate" value="${product.publisherDate}"><br>
                                                    Genre: <select class="form-control" name="genres">
                                                        <option value="">-- Choose Genre --</option>
                                                        <c:forEach items="${genreList3}" var="genre">
                                                            <option value="${genre.genreName}">${genre.genreName}</option>
                                                        </c:forEach>
                                                    </select>
                                                    Price: <input type="text" name="price" value="${product.price}"><br>
                                                    Quantity: <input type="text" name="quantity" value="${product.quantity}"><br>
                                                    Details: <input type="text" name="detailbook" value="${product.detailbook}"><br>
                                                    Image 1: <input type="text" name="image1" value="${product.img_1}"><br>
                                                    Image 2: <input type="text" name="image2" value="${product.img_2}"><br>
                                                    Image 3: <input type="text" name="image3" value="${product.img_3}"><br>
                                                    Image 4: <input type="text" name="image4" value="${product.img_4}"><br>
                                                    <input type="submit" value="update">
                                                </form>
                                                <form method="post" action="product_manage?action=deleteproduct" style="display: inline;" id="deleteForm${product.bookID}">
                                                    <input type="hidden" name="action" value="deleteproduct">
                                                    <input type="hidden" name="bookID" value="${product.bookID}">
                                                    <button type="button" class="delete-product-btn" onclick="confirmDelete('${product.bookID}')">Delete</button>
                                                </form>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
        <script>
            function sortTableByPriceDescending() {
                var table, rows, switching, i, x, y, shouldSwitch;
                table = document.getElementById("sampleTable");
                switching = true;
                while (switching) {
                    switching = false;
                    rows = table.rows;
                    for (i = 1; i < (rows.length - 1); i++) {
                        shouldSwitch = false;
                        x = rows[i].getElementsByTagName("td")[6]; // Column index for Price (change if needed)
                        y = rows[i + 1].getElementsByTagName("td")[6]; // Column index for Price (change if needed)
                        if (Number(x.innerHTML) < Number(y.innerHTML)) {
                            shouldSwitch = true;
                            break;
                        }
                    }
                    if (shouldSwitch) {
                        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                        switching = true;
                    }
                }
            }

            function showUpdateForm(bookID, bookName, authorName, publisherName, publisherDate, price, quantity, detailbook, img_1, img_2, img_3, img_4) {
                // Hide all other update forms first
                jQuery("form[id^='updateForm']").hide();

                // Show the form for this product
                var formID = "updateForm" + bookID;
                var form = document.getElementById(formID);

                // Pre-fill the form with current product details
                form.elements["bookName"].value = decodeURIComponent(bookName);
                form.elements["authorName"].value = authorName;
                form.elements["publisherName"].value = publisherName;
                form.elements["publisherDate"].value = publisherDate;
                form.elements["price"].value = price;
                form.elements["quantity"].value = quantity;
                form.elements["detailbook"].value = detailbook;
                form.elements["image1"].value = img_1;
                form.elements["image2"].value = img_2;
                form.elements["image3"].value = img_3;
                form.elements["image4"].value = img_4;

                // Show the form
                jQuery("#" + formID).show();
            }
        </script>

        <script>
            function showLogoutBox() {
                document.getElementById('logoutBox').style.display = 'block';
            }

            function logout() {
                window.location.href = 'index.html';
            }

            function cancelLogout() {
                window.location.href = 'product_manage';
            }

            function openPopup(img1, img2, img3, img4) {
                // Set the src attribute of each image element to the corresponding image URL
                document.getElementById("img1").src = img1;
                document.getElementById("img2").src = img2;
                document.getElementById("img3").src = img3;
                document.getElementById("img4").src = img4;

                // Display the popup
                document.getElementById("popup").style.display = "block";
            }

            function closePopup() {
                // Hide the popup
                document.getElementById("popup").style.display = "none";
            }
            function searchBooksByName() {
                var input, filter, table, tr, td, i, txtValue;
                input = document.getElementById("searchInput");
                filter = input.value.toUpperCase();
                table = document.getElementById("sampleTable");
                tr = table.getElementsByTagName("tr");

                // Loop through all table rows, and hide those that don't match the search query
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[1]; // Column index for book name, change if needed

                    if (td) {
                        txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }
            }

        </script>
        <script>
            function confirmDelete(bookID) {
                var result = window.confirm("Are you sure you want to delete this product?");
                if (result) {
                    // Submit the form to delete the product
                    document.getElementById("deleteForm" + bookID).submit();
                }
            }
        </script>
        <script>
            var myApp = new function () {
                this.printTable = function () {
                    var tab = document.getElementById('sampleTable');
                    var win = window.open('', '', 'height=700,width=700');
                    win.document.write(tab.outerHTML);
                    win.document.close();
                    win.print();
                }
            }
        </script>

    </body>

</html>