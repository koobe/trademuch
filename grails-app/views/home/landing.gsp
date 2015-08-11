<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="ico/favicon.ico">

    <title>Trade Much Landing Page</title>

    <!-- CSS Plugins -->
    <link href="/wolfram/css/plugins/animate.css" rel="stylesheet">
    <link href="/wolfram/css/plugins/lightbox.css" rel="stylesheet">
    <link href="/wolfram/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/wolfram/fonts/open-iconic/font/css/open-iconic-bootstrap.css" rel="stylesheet">

    <!-- CSS Custom -->
    <link href="/wolfram/css/style.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style type="text/css">
    body.classic .welcome_classic {
        background-image: url(/wolfram/img/bg-pattern_alt.png), url(/bonnie/landing_blank.jpg);
        background-attachment: scroll;
    }

    body.classic #team {
        background-attachment: scroll;
    }

    footer {
        background-image: url(/bonnie/bottom.jpg);
        background-size: cover;
    }

    footer ul, footer ul li {
        list-style: none;
        margin: 0;
        padding: 0;
        line-height: 150%;
    }

    footer .social__items {
        padding-top: 30px;
    }

    footer .social__item i {
        border: 1px solid white;
        padding: 10px;
        border-radius: 20px;
        display: inline-block;
        width: 36px;
    }
    
    #story img {
        max-width: 100%;
    }

    #story td {
        padding: 4px;
    }

    #features img {
        max-width: 100%;
    }

    body.classic #team {
        background-image: url(/wolfram/img/bg-pattern.png), url(/bonnie/about.jpg);
        background-size: auto, cover;
    }
    </style>
</head>

<body class="classic" data-spy="scroll" data-target=".scrollspy_menu">

<!-- PRELOADER
    ============================== -->
<div class="preloader">
    <img src="/wolfram/img/preloader.gif" alt="Loading..." class="preloader__img">
</div>


<!-- NAVBAR
    ============================== -->
<div class="navbar navbar-default navbar__initial navbar-fixed-top scrollspy_menu" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#welcome">Trade Much</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="fullpage__nav nav navbar-nav navbar-right">
                <li>
                    <g:link controller="login" action="auth">Sign up</g:link>
                </li>
                <li>
                    <oauth:connect provider="facebook" id="facebook-connect-link">
                        <i class="fa fa-facebook-square"></i>
                        Log in
                    </oauth:connect>
                </li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</div>


<!-- SIDEBAR
    ============================== -->

<!-- Sidebar button open -->
<div class="hidden sidebar__btn sidebar__btn_open">
    <span class="sidebar-btn__caption">Menu</span>
    <span class="oi oi-menu sidebar-btn__icon sidebar-btn-icon__unhover " title="Open menu" aria-hidden="true"></span>
    <span class="oi oi-arrow-left sidebar-btn__icon sidebar-btn-icon__hover" title="Open menu" aria-hidden="true"></span>
</div>

<!-- Sidebar menu -->
<div class="sidebar__menu sidebar__menu_hidden scrollspy_menu">

    <!-- Sidebar button close -->
    <div class="sidebar__btn sidebar__btn_close">
        <span class="sidebar-btn__caption">Menu</span>
        <span class="oi oi-menu sidebar-btn__icon sidebar-btn-icon__unhover " title="Close menu" aria-hidden="true"></span>
        <span class="oi oi-arrow-right sidebar-btn__icon sidebar-btn-icon__hover" title="Close menu" aria-hidden="true"></span>
    </div>

    <!-- Sidebar brand name -->
    <div class="sidebar-menu__brand">Trade Much</div>

    <!-- Sidebar links -->
    <ul class="fullpage__nav sidebar-menu__ul nav">
        <li><a href="#contact">Sign up</a></li>
        <li><a href="#contact">Log in</a></li>
    </ul>

</div> <!-- / .sidebar-menu__ul -->


<!-- WELCOME
    ============================== -->
<div class="welcome_classic" id="welcome">
    <div class="welcome-classic__inner">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">

                    <!-- Button -->
                    <div class="text-center">

                        <a href="/explore" class="btn btn-xl btn-primary" style="font-family: Helvitca; font-size: 18px; text-transform: none; letter-spacing: 1px; padding: 10px 50px; background: #333333; opacity: .8;">
                            <span class="oi oi-arrow-right" title="Find out more" aria-hidden="true"></span>
                            <span>Explore Now</span>
                        </a>

                    </div>

                </div>
            </div> <!-- / .row -->
        </div> <!-- / .container -->
    </div> <!-- / .classic-welcome__inner -->
</div> <!-- / .welcome_classic -->


<!-- ABOUT
    ============================== -->
<div class="site-wrapper" id="about">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-10 col-md-8 col-sm-offset-1 col-md-offset-2">
                <div class="lead text-center text">
                    <h3>Our Service</h3>
                    <em>Exchange, Buy and Sell</em>
                </div>
            </div>
        </div> <!-- / .row -->
    </div> <!-- / .container -->
</div> <!-- / .site-wrapper_classic -->

<!-- TEAM
    ============================== -->
<div class="site-wrapper" id="team">
    <div class="container">
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>通訊技術，造就了一個天涯若比鄰，但卻又是比鄰若天涯的時代；</p>
        <p>身處網路世界的你我，有多久不曾感受到，左鄰右舍的人情溫暖？</p>
        <p>&nbsp;</p>
        <p>電子商務，產生了一個易於滿足慾望，但也伴隨浪費的購物環境；</p>
        <p>面對過度消費的生態，又有多少可利用的資源，卻閒置在屋內的一角？</p>
        <p>&nbsp;</p>
        <p>TradeMuch，讓你我將手邊閒置的資源，包裝著溫暖的祝福，就近分享給街坊鄰居。</p>
        <p>TradeMuch，讓你我所需的物件，由每日相見的他／她，帶來遠在天邊近在眼前的驚喜。</p>
        <p>&nbsp;</p>
        <p>TradeMuch，讓周圍最熟悉的陌生人，真正變成你我的最麻吉。</p>
        <p>TradeMuch，將體現遠親不如近鄰的真實意義。 TradeMuch！最麻吉！</p>
    </div> <!-- / .container -->
</div> <!-- / .site-wrapper -->

<!-- FEATURES
    ============================== -->
<div class="site-wrapper" id="features">
    <div class="container">
        <div class="text-center">
            <h3>Now Start to explore with us</h3>
        </div>

        <div class="text-center">

            <img src="/bonnie/wanttobuy.png" style="width:150px" alt="story" />

            <img src="/bonnie/wanttosell.png" style="width:150px" alt="story" />

            <img src="/bonnie/seeall.png" style="width:150px" alt="story" />

        </div>

    </div> <!-- / .container -->
</div> <!-- / .site-wrapper -->

<div class="site-wrapper" id="story">
    <div class="container">
        <div class="text-center">
            <h1 class="heading">
                <span class="text-primary">Trade Much</span> Trade Easy
            </h1>
            <p class="heading__sub">
                near by you or over the countrys
            </p>
        </div>


        <table>
            <tr>
                <td width="24%" rowspan="2">
                    <img src="/bonnie/1515_font_27.jpg" alt="story" />
                </td>
                <td width="52%">
                    <img src="/bonnie/1515_font_24.jpg" alt="story" />
                </td>
                <td width="24%">
                    <img src="/bonnie/freepost.png" alt="story" />
                </td>
            </tr>
            <tr>
                <td>
                    <img src="/bonnie/1515_font_31.jpg" alt="story" />
                </td>
                <td>
                    <img src="/bonnie/exchange.png" alt="story" />
                </td>
            </tr>
            <tr>
                <td>
                    <img src="/bonnie/empty.png" alt="story" />
                </td>
                <td colspan="2">
                    <img src="/bonnie/1515_font_36.jpg" alt="story" />
                </td>
            </tr>
        </table>
    </div> <!-- / .container -->
</div> <!-- / .site-wrapper -->

<div class="text-center" style="margin-top: 50px">
    <h1 class="heading">
        <span class="text-primary">Explore</span> by Map
    </h1>
    <p class="heading__sub">
        near by you or over the countrys
    </p>
</div>

<!-- Google Map -->
<div class="site-wrapper">
    <div id="map-canvas" class="contact__map"></div>
</div> <!-- / .site-wrapper -->

<!-- FOOTER
    ============================== -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-xs-4 col-sm-3">
                &nbsp;
            </div>
            <div class="col-xs-4 col-sm-3">
                <h4>Company</h4>
                <ul>
                    <li>About</li>
                    <li>Term &amp; Privacy</li>
                </ul>
            </div>
            <div class="col-xs-4 col-sm-3">
                <h4>How to use?</h4>
                <ul>
                    <li>Help</li>
                    <li>Site map</li>
                </ul>
            </div>
            <div class="col-xs col-sm-3">
                <div class="social__items">
                    Follow us on
                    <a href="#" class="social__item">
                        <i class="fa fa-twitter"></i>
                    </a>
                    <a href="#" class="social__item">
                        <i class="fa fa-facebook"></i>
                    </a>
                    <a href="#" class="social__item">
                        <i class="fa fa-google-plus"></i>
                    </a>
                </div> <!-- / .social__links -->
            </div>
        </div>
    </div>
</footer>


<!-- JavaScript
    ================================================== -->

<!-- JS Global -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js"></script>
<script src="/wolfram/js/bootstrap/bootstrap.min.js"></script>

<!-- JS Plugins -->
<script src="/wolfram/js/plugins/jquery.parallax-1.1.3.js"></script>
<script src="/wolfram/js/plugins/smoothscroll.js"></script>
<script src="/wolfram/js/plugins/jquery.waypoints.min.js"></script>
<script src="/wolfram/js/plugins/imagesloaded.pkgd.min.js"></script>
<script src="/wolfram/js/plugins/isotope.pkgd.min.js"></script>
<script src="/wolfram/js/plugins/lightbox.min.js"></script>
<script src="/wolfram/js/plugins/contact.js"></script>
<script src="/wolfram/js/plugins/google-maps.js"></script>

<!-- JS Custom -->
<script src="/wolfram/js/custom_classic.js"></script>
<script src="/wolfram/js/custom.js"></script>


</body>
</html>