#!/bin/bash
#@(#) generate header for an HTML document including CSS style information
TITLE="$1"

HEADER(){
cat <<EOF
<html>
<head>
<title>$TITLE</title>
<meta name="keywords" content="Fortran, Fortran code, Fortran source code repository, Fortran library, Fortran archive,         " />
<meta name="keywords" content="General Purpose Fortran, Fortran modules, Fortran examples                                       " />
EOF
cat <<\EOF
<style>
body {xfont-style: italic}
body { background-color:#FFF; color:#333; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:1em; line-height:1.3em; }

a,li span { color:#000; }
a:visited { color:#666; }
a:hover, a.nav:hover, a:hover math { background-color:#000; color:#FFF; }
a.nav,a:link.nav, a:visited.nav { background-color:#FFF; color:#000; }

h1,h2,h3,h4,h5,h6 { color:#333; font-family:georgia, verdana, sans-serif; }
h1 { font-size:200%; line-height: 1.1em;color:#F33}
h2 { font-size:173%; }
h3 { font-size:144%; }
h4 { font-size:120%; }
h5,h6 { font-size:100% }
table { border:double #000; border-collapse:collapse; }
td { border:thin solid #888; margin: auto; padding: auto; border: auto;}
td { padding-left: 1em; padding-right: 1em;}
li { margin-bottom:0.5em; }
blockquote { display:block; font-size:90%; font-style:italic; line-height:1.5em; margin:0 0 1.5em; padding:0 2.5em; }
pre { background-color:#DDD; font-size:90%; overflow:auto; padding:1em; }
xmp { background-color:#DCC; font-size:80%; display: block; font-family: monospace; white-space: pre; margin: 1em 0; }

#Container { margin:0 10px; text-align:center; }
#Content { border-top:none; margin:auto; padding:0.3em; text-align:left; width:100%; max-width:55em; }
span.webName { font-size:.5em; }
textarea#content { font-size: 1em; line-height: 1.125; }
h1#pageName { line-height:1em; margin:0.2em 0 0.2em 0; padding:0; }
.property { color:#666; font-size:80%; }
a.existingWikiWord[title]{ //border: 1px dashed #BBB; }
.byline { color:#666; font-size:.8em; font-style:italic; margin-bottom:1em; padding-top:1px; }
</style>
</head>
<body>
<a href="http://www.urbanjost.altervista.org/LIBRARY/libjust4/just4.html">[CLI Home Page]</a>
<div id="Container">
<div id="Content">
EOF
}
HEADER
