local nazv = {
  ["ru"] = {
    "Медаль\n«За победу над Германией в Великой Отечественной войне\n1941-1945 гг.»",
    "Золотая медаль\n«Серп и Молот»",
    "Орден\n«Победа»",
    "Орден\nЛенина",
    "Медаль\n«Золотая Звезда»",
    "Медаль\n«Партизану Отечественной войны»\nI степени",
    "Медаль\nУшакова",
    "Орден\nСуворова III степени",
    "Медаль\nНахимова",
    "Орден\nБогдана Хмельницкого\nI степени",
    "Медаль\n«За отвагу»\n1938 года",
    "Орден\nКутузова I степени ",
    "Медаль «Партизану Отечественной войны»\nII степени ",
    "Медаль\n«За взятие Берлина»",
    "Орден\nКутузова II степени ",
    "Орден\nОтечественной войны\nI степени",
    "Медаль\n«За трудовую доблесть»\n1938 года",
    "Орден\nСлавы I степени ",
    "Орден\nКутузова III степени",
    "Медаль\n«За взятие Будапешта»",
    "Орден\nСлавы II степени",
    "Орден\nНахимова I степени",
    "Орден\nКрасного Знамени",
    "«Медаль\nматеринства» I степени",
    "Медаль\n«За оборону Кавказа»",
    "Орден\nКрасной звезды",
    "Орден\nСуворова I степени",
    "Медаль\n«За отвагу» 1943 года",
    "Медаль\n«За оборону Одессы»",
    "Орден\n«Материнская слава»\nII степени",
    "Орден\nСуворова II степени",
    "Медаль\n«За оборону Ленинграда»",
    "Орден\nУшакова I степени",
    "Медаль\n«За оборону Севастополя»",
    "Юбилейная медаль\n«ХХ лет Рабоче-Крестьянской Красной Армии»\n1943 года",
    "Орден\nУшакова II степени",
    "«Медаль материнства»\nII степени",
    "Медаль\n«За боевые заслуги»",
    "Орден\nОтечественной войны\nII степени",
    "Орден\nАлександра Невского",
    "Медаль\n«За победу над Японией»",
    "Медаль\n«За освобождение Праги»",
    "Орден\nСлавы III степени",
    "Медаль\n«За освобождение Варшавы»",
    "Орден\nНахимова II степени",
    "Медаль\n«За освобождение Белграда»",
    "Медаль\n«За взятие Вены»",
    "Орден\n«Материнская слава»\nIII степени",
    "Медаль\n«За взятие Кенигсберга» ",
    "Медаль\n«За доблестный труд в Великой Отечественной войне 1941-1945 гг.»",
    "Орден\n«Материнская слава»\nI степени",
    "Медаль\n«За оборону Советского Заполярья»",
    "Медаль\n«За оборону Москвы»",
    "Орден\nБогдана Хмельницкого\nII степени",
    "Медаль\n«За оборону Сталинграда»",
    "Медаль\n«За трудовое отличие» ",
    "Медаль\n«За трудовую доблесть»\n1943 года",
    "Орден\nБогдана Хмельницкого\nIII степени",
    "Юбилейная медаль\n«ХХ лет Рабоче-Крестьянской Красной Армии»\n1938 года",
    "Медаль\n«За освобождение Кореи»",
  },
  ["en"] = {
    "Medal\n«For the Victory Over Germany in the Great Patriotic War\n1941–1945»",
    "Gold Medal\n«Sickle and Hammer»",
    "Order of Victory",
    "Order of Lenin",
    "Madal\n«Gold Star»",
    "Madal\n«Partisan of the Patriotic War»\nI class",
    "Medal\nUshakov",
    "Order of Suvorov\nIII class",
    "Medal\nNakhimov",
    "Order\nof Bogdan Khmelnitsky\nI class",
    "Medal\n«For Courage»\n1938 year",
    "Order Of Kutuzov\nI class",
    "Madal\n«Partisan of the Patriotic War»\nII class",
    "Medal\n«For the Capture of Berlin»",
    "Order Of Kutuzov\nII class",
    "Order\nof the Patriotic War\nI class",
    "Medal\n«For Labour Valour»\n1938 year",
    "Order of Glory\nI class",
    "Order Of Kutuzov\nIII class",
    "Medal\n«For the Capture of Budapest»",
    "Order of Glory\nII class",
    "Order of Nakhimov\nI class",
    "Order\nof the Red Banner",
    "«Maternity Medal»\nI class",
    "Medal\n«For the Defence of the Caucasus»",
    "Order\nof the Red Star",
    "Order of Suvorov\nI class",
    "Medal\n«For Courage» 1943 year",
    "Medal\n«For the Defence of Odessa»",
    "Order of Maternal Glory\nII class",
    "Order of Suvorov\nII class",
    "Medal\n«For the Defence of Leningrad»",
    "Order of Ushakov\nI class",
    "Medal\n«For the Defence of Sevastopol»",
    "Jubilee Medal\n«XX Years of the Workers and Peasants Red Army»\n1943 year",
    "Order of Ushakov\nII class",
    "«Maternity Medal»\nII class",
    "Medal\n«For Battle Merit»",
    "Order of the Patriotic War\nII class",
    "Order of Alexander Nevsky",
    "Medal\n«For the Victory over Japan»",
    "Medal\n«For the Liberation of Prague»",
    "Order of Glory\nIII class",
    "Medal\n«For the Liberation of Warsaw»",
    "Order of Nakhimov\nII class",
    "Medal\n«For the Liberation of Belgrade»",
    "Medal\n«For the Capture of Vienna»",
    "Order of Maternal Glory\nIII class",
    "Medal\n«For the Capture of Königsberg» ",
    "Medal\n«For Valiant Labour in the Great Patriotic War 1941–1945»",
    "Order of Maternal Glory\nI class",
    "Medal\n«For the Defence of the Soviet Transarctic»",
    "Medal\n«For the Defence of Moscow»",
    "Order\nof Bogdan Khmelnitsky\nII class",
    "Medal\n«For the Defence of Stalingrad»",
    "Medal\n«For Distinguished Labour» ",
    "Medal\n«For Labour Valour»\n1943 year",
    "Order\nof Bogdan Khmelnitsky\nIII class",
    "Jubilee Medal\n«XX Years of the Workers and Peasants Red Army»\n1938 year",
    "Medal\n«For the Liberation of Korea»",
  }
}
return nazv
