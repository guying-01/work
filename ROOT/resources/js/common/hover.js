// JavaScript Document
$(function() {
    $('.topnav li').mouseover(function() {
        $(this).children('.top-li-pop').show()
    });
    $('.topnav li').mouseleave(function() {
        $(this).children('.top-li-pop').hide()
    });
    $('.submenu').mouseover(function() {
        $(this).children('.submenu-floating').show()
    });
    $('.submenu').mouseleave(function() {
        $(this).children('.submenu-floating').hide()
    });
    $('.menu').mouseover(function() {
        $(this).children('.menu-div').show()
    });
    $('.menu').mouseleave(function() {
        $(this).children('.menu-div').hide()
    });
    $('.shopMenu').mouseover(function() {
        $(this).children('.shopMenuDiv').show()
    });
    $('.shopMenu').mouseleave(function() {
        $(this).children('.shopMenuDiv').hide()
    });
    $('.nav li').mouseover(function() {
        $(this).children('dl').show()
    });
    $('.nav li').mouseleave(function() {
        $(this).children('dl').hide()
    });
})