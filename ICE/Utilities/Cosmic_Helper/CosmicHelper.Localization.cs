using ECommons.DalamudServices;
using ICE.Enums;
using Lumina.Excel.Sheets;
using System.Collections.Generic;

namespace ICE.Utilities.Cosmic_Helper;

public static unsafe partial class CosmicHelper
{
    private static readonly Dictionary<CosmicWeather, uint> WeatherSpecialCondIds = new()
    {
        [CosmicWeather.UmbralWind] = 13,
        [CosmicWeather.MoonDust] = 14,
        [CosmicWeather.Clouds] = 15,
        [CosmicWeather.Rain] = 16,
        [CosmicWeather.ClearSkies] = 23,
        [CosmicWeather.FairSkies] = 24,
    };

    public static string GetCosmicWeatherName(CosmicWeather weather)
    {
        if (weather == CosmicWeather.None)
            return T("None");

        if (WeatherSpecialCondIds.TryGetValue(weather, out var condId))
        {
            var cond = Svc.Data.GetExcelSheet<WKSMissionLotterySpecialCond>().GetRow(condId);
            var weatherName = cond.WeatherRequired.Value.Name.ToString();
            if (!string.IsNullOrWhiteSpace(weatherName))
                return weatherName;
        }

        return weather.ToString();
    }
}
