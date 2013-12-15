var TTS = require("com.giorgos.ttsios7");

var textToDictate = "Dwalend door het landschap van euforische lichten en geen besef meer van tijd, liep ik van uit de Cave de duisternis in om even tot rust te komen in de backstage. Op weg naar de nodige verfrissing kwam jij in mijn blikveld terecht. De godin van de nooduitgang met haar blonde haren en haar verblinde glimlach. De glimlach voelde als een lichtstraal in de duisternis van de backstage, waardoor het euforische gevoel in mij weer naar boven kwam. Terwijl alleen het licht van het bordje van de nooduitgang te zien was. Daar ging ik dan mijn gevoel volgend richting de imposante deuren van de nooduitgang die jij stond te bewaken. Vragend hoe je hier terecht gekomen was?! Je vertelde me dat je als servicemedewerker moest werken op Time Warp en niet had verwacht dat je de hele avond in je eentje bij de nooduitgang zou moeten staan. Ik voelde gelijk de eenzaamheid met je mee, we hebben over van alles gepraat zo weet ik dat je dierengeneeskunde studeert, 24 jaar bent en woont in Utrecht. Helaas moest ik weer door op mijn tocht naar verfrissing, de keel moest immers met regelmaat van de klok worden gesmeerd.";


// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white',
	layout:"vertical"
});

var speakButton = Ti.UI.createButton({
	title:"Speak",
	height:100
});

var shutupButton = Ti.UI.createButton({
	title:"Please, shut up :)",
	height:100
});

win.open();

speakButton.addEventListener("click", function(e){
	TTS.speak({
		text:textToDictate,
		rate:0.1,//optional, default
		pitch:1.5//optional, default 
	});
});

//boolean, read only, check if speaking or not
//TTS.speaking

//boolean, read only, check if paused or not
//TTS.paused