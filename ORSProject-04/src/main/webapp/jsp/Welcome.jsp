
<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">

<title>Welcome Page</title>

<!-- Bootstrap Icons -->
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

</head>


<body>

    <%@ include file="Header.jsp"%>


    <!-- WELCOME SECTION -->

    <div class="bg-white position-relative overflow-hidden"
         style="min-height: 80vh;">

        <!-- LIGHT BLUE BACKGROUND SHAPE -->

        <div class="position-absolute"
             style="
             width: 450px;
             height: 450px;
             background: #f0f6ff;
             border-radius: 50%;
             top: -180px;
             right: -120px;
             z-index: 0;">
        </div>


        <div class="position-absolute"
             style="
             width: 300px;
             height: 300px;
             background: #f7faff;
             border-radius: 50%;
             bottom: -130px;
             left: -100px;
             z-index: 0;">
        </div>


        <!-- MAIN CONTENT -->

        <div class="container position-relative"
             style="z-index: 1; padding-top: 100px; padding-bottom: 100px;">

            <div class="row align-items-center">


                <!-- LEFT CONTENT -->

                <div class="col-md-7">

                    <div class="mb-3">

                        <i class="bi bi-mortarboard-fill text-primary"
                           style="font-size: 55px;">
                        </i>

                    </div>


                    <h1 class="fw-bold text-primary mb-3"
                        style="font-size: 48px;">

                        Welcome to ORS

                    </h1>


                    <% if (isLogin) { %>

                        <h4 class="text-dark mb-3">
                            Hello <%= userBean.getFirstName() %>!
                        </h4>

                    <% } else { %>

                        <h4 class="text-dark mb-3">
                            Hello Guest!
                        </h4>

                    <% } %>


                    <p class="text-secondary"
                       style="font-size: 18px; line-height: 1.8; max-width: 650px;">

                        Online Result System (ORS) is used to maintain reocrd of student and marksheet

                    </p>


                    <!-- FEATURES -->

                    <div class="row mt-4">

                        <div class="col-md-4 mb-3">

                            <div class="d-flex align-items-center">

                                <i class="bi bi-people-fill text-primary me-3"
                                   style="font-size: 30px;">
                                </i>

                                <div>

                                    <h6 class="fw-bold mb-1">
                                        Students
                                    </h6>

                                    <small class="text-secondary">
                                        Student Management
                                    </small>

                                </div>

                            </div>

                        </div>


                        <div class="col-md-4 mb-3">

                            <div class="d-flex align-items-center">

                                <i class="bi bi-book-fill text-primary me-3"
                                   style="font-size: 30px;">
                                </i>

                                <div>

                                    <h6 class="fw-bold mb-1">
                                        Courses
                                    </h6>

                                    <small class="text-secondary">
                                        Course Management
                                    </small>

                                </div>

                            </div>

                        </div>


                        <div class="col-md-4 mb-3">

                            <div class="d-flex align-items-center">

                                <i class="bi bi-bar-chart-fill text-primary me-3"
                                   style="font-size: 30px;">
                                </i>

                                <div>

                                    <h6 class="fw-bold mb-1">
                                        Results
                                    </h6>

                                    <small class="text-secondary">
                                        Result Management
                                    </small>

                                </div>

                            </div>

                        </div>

                    </div>


                    <!-- LOGIN MESSAGE -->

                    <% if (isLogin) { %>

                        <div class="mt-4 text-primary">

                            <i class="bi bi-check-circle-fill me-2"></i>

                            You are successfully logged in.

                        </div>

                    <% } else { %>

                        <div class="mt-4 text-secondary">

                            <i class="bi bi-info-circle-fill me-2"></i>

                            Please login to access ORS features.

                        </div>

                    <% } %>

                </div>


                <!-- RIGHT SIDE -->

                <div class="col-md-5 text-center mt-5 mt-md-0">

                    <div class="p-5">

                        <i class="bi bi-laptop text-primary"
                           style="font-size: 150px;">
                        </i>

                        <h5 class="fw-bold text-dark mt-3">
                            Online Result System
                        </h5>

                        <p class="text-secondary">
                            Simple. Organized. Efficient.
                        </p>

                    </div>

                </div>

            </div>

        </div>

    </div>


    <%@ include file="Footer.jsp"%>


</body>

</html>
