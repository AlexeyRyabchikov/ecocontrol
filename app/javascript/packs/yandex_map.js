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
    myMap.geoObjects.add(myCircle);

    // Включаем редактирование круга.
    myCircle.editor.startEditing();
}