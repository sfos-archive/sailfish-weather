import QtQuick 2.0
import Sailfish.Silica 1.0
import org.sailfishos.weather.settings 1.0
import org.nemomobile.configuration 1.0

Page {
    id: root
    ConfigurationValue {
        id: temperatureUnitValue
        key: "/sailfish/weather/temperature_unit"
        defaultValue: "BasedOnLocale"
    }
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: content.height + Theme.paddingLarge

        Column {
            id: content
            width: parent.width

            PageHeader {
                //% "Weather"
                title:  qsTrId("weather_settings-he-weather")
            }
            ComboBox {
                //% "Temperature units"
                label: qsTrId("weather_settings-la-temperature_units")

                Component.onCompleted: {
                    switch (temperatureUnitValue.value) {
                    case "BasedOnLocale":
                        currentIndex = 0
                        break
                    case "Celsius":
                        currentIndex = 1
                        break
                    case "Fahrenheit":
                        currentIndex = 2
                        break
                    default:
                        console.log("WeatherSettings: Invalid temperature unit value", temperatureUnitValue.value)
                        break
                    }
                }
                currentIndex: weatherSettings.distanceUnits

                menu: ContextMenu {
                    MenuItem {
                        //% "Follow country"
                        text: qsTrId("weather_settings-me-follow_country")
                        onClicked: temperatureUnitValue.value = "BasedOnLocale"
                    }
                    MenuItem {
                        //% "Celsius"
                        text: qsTrId("weather_settings-me-celsius")
                        onClicked: temperatureUnitValue.value = "Celsius"
                    }
                    MenuItem {
                        //% "Fahrenheit"
                        text: qsTrId("weather_settings-me-fahrenheit")
                        onClicked: temperatureUnitValue.value = "Fahrenheit"
                    }
                }
            }
        }
    }
}
