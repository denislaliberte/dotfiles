//no sidebar junk twitter
$('.dashboard-left').hide()
$('.dashboard-right').hide()
$('#timeline').width('620px')
$('.content-main').css('float','left')
//remove retweet, only on the first load of the page
$('[data-retweeter]:not([data-retweeter=""])').hide()
