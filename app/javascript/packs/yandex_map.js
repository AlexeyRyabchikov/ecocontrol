ymaps.ready(init);

function init() {
    const map = document.getElementById('map');
    map.innerHTML = '';
    // Создаем карту.
    var myMap = new ymaps.Map("map", {
            center: [55.16, 61.43],
            zoom: 12,
            controls: []
        }, {
            searchControlProvider: 'yandex#search'
        });

    // Создаем круг.
    var myCircle = new ymaps.Circle([
            // Координаты центра круга.
            [55.16, 61.43],
            // Радиус круга в метрах.
            1500
        ], {}, {
            // Задаем опции круга.
            // Цвет заливки.
            fillColor: "#378c49",
            fillOpacity: 0.2,
            // Цвет обводки.
            strokeColor: "#378c49",
            // Прозрачность обводки.
            strokeOpacity: 0.8,
            // Ширина обводки в пикселях.
            strokeWidth: 3
        });

    // Добавляем круг на карту.
    myMap.geoObjects
         .add(myCircle)
         .add(new ymaps.Placemark([55.164758, 61.438521], {
              balloonContent: 'ООО "Рога и Копыта'
          }, {
              preset: 'islands#icon',
              iconColor: '#0095b6'
          }))
          .add(new ymaps.Placemark([55.134739, 61.415372], {
               balloonContent: 'ООО "ЧТМЗ"'
           }, {
               preset: 'islands#icon',
               iconColor: '#0095b6'
           }))
          .add(new ymaps.Placemark([55.158729, 61.447941], {
               balloonContent: 'ООО "Правило 34"'
           }, {
               preset: 'islands#icon',
               iconColor: '#0095b6'
           }))
          .add(new ymaps.Placemark([55.162322, 61.424820], {
               balloonContent: 'ООО "Трубопрокатный парень"'
           }, {
               preset: 'islands#icon',
               iconColor: '#0095b6'
           }))
          .add(new ymaps.Placemark([55.155703, 61.435555], {
               balloonContent: 'ОАО "Радий"'
           }, {
               preset: 'islands#icon',
               iconColor: '#0095b6'
           }))
          .add(new ymaps.Placemark([55.155703, 61.435555], {
               balloonContent: 'Жалоба: затрудненное дыхание, помутнение сознания'
           }, {
               preset: 'islands#icon',
               iconColor: 'red'
           }));

    // Включаем редактирование круга.
    myCircle.editor.startEditing();
}