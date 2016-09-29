var summonerName = "";
var summonerId = "";
var posturl = "?api_key=RGAPI-a5ebd073-e1b5-47a9-9fdf-950726c607ee";

document.addEventListener('DOMContentLoaded', function(){
    var url = "https://euw.api.pvp.net/api/lol/euw/v1.4/summoner/by-name/";
    $('#user_new').submit(function(e) {
      e.preventDefault(); 
      summonerName = $('#user_name').val();
      var query = "" + url + summonerName + posturl;
      proxy("GET", query, "json").then(userSuccess);
    });
})

function userSuccess(user) {
  summonerId = user[summonerName].id;
  console.log(summonerId);
  $('#user_summoner_id').val(summonerId);
  var query = "https://euw.api.pvp.net/api/lol/euw/v2.5/league/by-summoner/"+ summonerId +"/entry" + posturl;
  proxy("GET", query, "json").then(userDataSuccess)
}

function userDataSuccess(dataUser){
  summonerTier = dataUser[summonerId][0].tier;
  if(summonerTier === "GOLD" ||  summonerTier === "DIAMOND" || summonerTier === "PLATINUM"){
    document.getElementById("user_new").submit();
  }else{
    alert("you don´t have enough level, play lol and improve your abilities");
  }
}
function proxy(method, url, responseType, params){
  return new Promise(function(resolve, reject) {
    var xhr = new XMLHttpRequest();
    xhr.open(method, url);
    xhr.withCredentials = false;
    xhr.responseType = responseType;
    xhr.onload = () => {
      if (xhr.status === 200){
        resolve(xhr.response);
      } else {
        reject(console.log(xhr.statusText));
      }
    };
    xhr.onerror = () => {
      reject(console.log('Error'));
    }
    xhr.send(params);
  });
};






