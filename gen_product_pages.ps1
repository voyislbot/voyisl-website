$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$utf8 = New-Object System.Text.UTF8Encoding($false)

$languages = @(
    @{ Key = "cn"; Dir = "" },
    @{ Key = "tw"; Dir = "zh-Hant" },
    @{ Key = "en"; Dir = "en" }
)

$categories = @{
    pilot = @{
        cn = @{ Name = "VT-Pilot®"; Label = "智能辅助驾驶"; File = "vt-pilot.html"; Image = "app-pilot.webp" }
        tw = @{ Name = "VT-Pilot®"; Label = "智能輔助駕駛"; File = "vt-pilot.html"; Image = "app-pilot.webp" }
        en = @{ Name = "VT-Pilot®"; Label = "Intelligent Driving"; File = "vt-pilot.html"; Image = "app-pilot.webp" }
    }
    cockpit = @{
        cn = @{ Name = "VT-Cockpit®"; Label = "智能座舱"; File = "vt-cockpit.html"; Image = "app-cockpit.webp" }
        tw = @{ Name = "VT-Cockpit®"; Label = "智能座艙"; File = "vt-cockpit.html"; Image = "app-cockpit.webp" }
        en = @{ Name = "VT-Cockpit®"; Label = "Intelligent Cockpit"; File = "vt-cockpit.html"; Image = "app-cockpit.webp" }
    }
}

$ui = @{
    cn = @{
        Home = "首页"; About = "关于寅家"; Tech = "技术路线"; Agents = "通用智能体"; News = "企业动态"; ESG = "ESG"; Join = "加入我们"
        Cars = "智能汽车"; Agri = "农业机器人"; LowAlt = "低空经济"; Robots = "具身机器人"
        Short = "简"; Trad = "繁"; English = "EN"
        Overview = "产品概览"; Capabilities = "核心能力"; Scenarios = "应用方向"; Related = "同系列产品"
        Back = "返回"; Contact = "联系我们"; Custom = "产品功能和配置可根据车型与项目需求定制，具体方案以项目评估为准。"
        Quick = "快速导航"; Brand = "寅家科技"; QR = "扫描二维码，关注寅家科技官方公众号"
        Honors = "企业荣誉"
    }
    tw = @{
        Home = "首頁"; About = "關於寅家"; Tech = "技術路線"; Agents = "通用智能體"; News = "企業動態"; ESG = "ESG"; Join = "加入我們"
        Cars = "智能汽車"; Agri = "農業機器人"; LowAlt = "低空經濟"; Robots = "具身機器人"
        Short = "簡"; Trad = "繁"; English = "EN"
        Overview = "產品概覽"; Capabilities = "核心能力"; Scenarios = "應用方向"; Related = "同系列產品"
        Back = "返回"; Contact = "聯絡我們"; Custom = "產品功能與配置可根據車型及專案需求定製，具體方案以專案評估為準。"
        Quick = "快速導覽"; Brand = "寅家科技"; QR = "掃描二維碼，關注寅家科技官方公眾號"
        Honors = "企業榮譽"
    }
    en = @{
        Home = "Home"; About = "About"; Tech = "Technology"; Agents = "Agents"; News = "News"; ESG = "ESG"; Join = "Join Us"
        Cars = "Intelligent Vehicles"; Agri = "Agricultural Robots"; LowAlt = "Low-Altitude Economy"; Robots = "Embodied Robots"
        Short = "简"; Trad = "繁"; English = "EN"
        Overview = "Product Overview"; Capabilities = "Core Capabilities"; Scenarios = "Application Scenarios"; Related = "Related Products"
        Back = "Back to"; Contact = "Contact Us"; Custom = "Features and configurations can be adapted to vehicle and project requirements. The final solution is subject to project evaluation."
        Quick = "Quick Links"; Brand = "VOYISL"; QR = "Scan the QR code to follow our official account"
        Honors = "Recognition"
    }
}

$products = @(
    @{
        File = "vt-avm.html"; Category = "pilot"; Image = "app-pilot.webp"
        cn = @{
            Name = "VT-AVM"; Short = "全景环视"
            Summary = "VT-AVM 通过多路摄像头采集车身周围画面，构建连续、直观的全景环视视野，帮助驾驶者在低速行驶与泊车过程中识别车辆周边障碍物和视野盲区。"
            Features = @(
                @("多路画面融合", "融合前、后、左、右多路摄像头画面，形成整车周边全景视野。"),
                @("多视角辅助", "围绕低速会车、狭窄道路和泊车场景提供多种环视观察方式。"),
                @("整车项目适配", "面向量产车型进行硬件、算法与显示方案适配，支持按项目配置。")
            )
            Apps = @("狭窄道路低速通行", "泊车与挪车辅助", "车身周边盲区观察")
        }
        tw = @{
            Name = "VT-AVM"; Short = "全景環視"
            Summary = "VT-AVM 透過多路攝影機採集車身周圍畫面，構建連續、直觀的全景環視視野，協助駕駛者在低速行駛與泊車過程中識別車輛周邊障礙物和視野盲區。"
            Features = @(
                @("多路畫面融合", "融合前、後、左、右多路攝影機畫面，形成整車周邊全景視野。"),
                @("多視角輔助", "圍繞低速會車、狹窄道路和泊車場景提供多種環視觀察方式。"),
                @("整車專案適配", "面向量產車型進行硬體、演算法與顯示方案適配，支援按專案配置。")
            )
            Apps = @("狹窄道路低速通行", "泊車與挪車輔助", "車身周邊盲區觀察")
        }
        en = @{
            Name = "VT-AVM"; Short = "Surround View"
            Summary = "VT-AVM combines images from multiple cameras to create a continuous surround-view perspective, helping drivers identify nearby obstacles and blind spots during low-speed driving and parking."
            Features = @(
                @("Multi-camera fusion", "Combines front, rear, left and right camera views into a complete perspective around the vehicle."),
                @("Multiple viewpoints", "Provides different viewing options for narrow roads, low-speed maneuvers and parking."),
                @("Vehicle integration", "Adapts hardware, perception algorithms and display layouts to volume-production vehicle programs.")
            )
            Apps = @("Low-speed driving in narrow lanes", "Parking and vehicle maneuvering", "Blind-spot observation")
        }
    },
    @{
        File = "vt-aps.html"; Category = "pilot"; Image = "app-pilot.webp"
        cn = @{
            Name = "VT-APS"; Short = "全场景智能泊车辅助"
            Summary = "VT-APS 围绕车位识别、泊车路径规划与过程辅助，为复杂停车场景提供系统化泊车支持，提升低速泊车过程的可控性与便利性。"
            Features = @(
                @("车位场景识别", "结合车辆感知信息识别可用车位和周边环境。"),
                @("泊车路径规划", "根据车位形态与车辆位置规划泊车路径，支持项目功能配置。"),
                @("过程安全辅助", "在泊车过程中持续关注周边目标，为驾驶者提供辅助提示。")
            )
            Apps = @("水平与垂直车位", "狭窄停车场", "低速泊车与挪车")
        }
        tw = @{
            Name = "VT-APS"; Short = "全場景智能泊車輔助"
            Summary = "VT-APS 圍繞車位識別、泊車路徑規劃與過程輔助，為複雜停車場景提供系統化泊車支援，提升低速泊車過程的可控性與便利性。"
            Features = @(
                @("車位場景識別", "結合車輛感知資訊識別可用車位和周邊環境。"),
                @("泊車路徑規劃", "根據車位形態與車輛位置規劃泊車路徑，支援專案功能配置。"),
                @("過程安全輔助", "在泊車過程中持續關注周邊目標，為駕駛者提供輔助提示。")
            )
            Apps = @("水平與垂直車位", "狹窄停車場", "低速泊車與挪車")
        }
        en = @{
            Name = "VT-APS"; Short = "Automated Parking Assist"
            Summary = "VT-APS provides systematic support for complex parking scenarios through parking-space recognition, path planning and process assistance, improving control and convenience at low speed."
            Features = @(
                @("Parking-space recognition", "Uses vehicle perception to identify available spaces and the surrounding environment."),
                @("Parking trajectory planning", "Plans a parking path based on the space layout and vehicle position."),
                @("Process assistance", "Monitors nearby objects during parking and provides assistance to the driver.")
            )
            Apps = @("Parallel and perpendicular spaces", "Constrained parking facilities", "Low-speed parking and maneuvering")
        }
    },
    @{
        File = "vt-fvc.html"; Category = "pilot"; Image = "app-pilot.webp"
        cn = @{
            Name = "VT-FVC"; Short = "ADAS 前视一体机"
            Summary = "VT-FVC 将前视摄像头与视觉算法集成于一体化产品，为车辆提供前向目标与车道环境感知能力，是智能辅助驾驶功能的重要感知入口。"
            Features = @(
                @("前向视觉感知", "面向车辆前方道路环境采集图像并完成视觉识别。"),
                @("目标与车道识别", "识别前方车辆、行人及车道线等关键交通元素。"),
                @("辅助驾驶集成", "可作为 ADAS 功能的前向感知单元，按车型项目进行适配。")
            )
            Apps = @("乘用车辅助驾驶", "商用车安全辅助", "前向感知系统集成")
        }
        tw = @{
            Name = "VT-FVC"; Short = "ADAS 前視一體機"
            Summary = "VT-FVC 將前視攝影機與視覺演算法整合於一體化產品，為車輛提供前向目標與車道環境感知能力，是智能輔助駕駛功能的重要感知入口。"
            Features = @(
                @("前向視覺感知", "面向車輛前方道路環境採集影像並完成視覺識別。"),
                @("目標與車道識別", "識別前方車輛、行人及車道線等關鍵交通元素。"),
                @("輔助駕駛整合", "可作為 ADAS 功能的前向感知單元，按車型專案進行適配。")
            )
            Apps = @("乘用車輔助駕駛", "商用車安全輔助", "前向感知系統整合")
        }
        en = @{
            Name = "VT-FVC"; Short = "ADAS Front Camera"
            Summary = "VT-FVC integrates a forward-facing camera and vision algorithms in a compact product, providing perception of vehicles, pedestrians and lane markings for intelligent driving assistance."
            Features = @(
                @("Forward vision", "Captures and interprets the road environment ahead of the vehicle."),
                @("Target and lane recognition", "Detects key road elements such as vehicles, pedestrians and lane markings."),
                @("ADAS integration", "Serves as a forward-perception unit for vehicle-specific ADAS programs.")
            )
            Apps = @("Passenger-vehicle assistance", "Commercial-vehicle safety", "Forward-perception integration")
        }
    },
    @{
        File = "vt-vulcan.html"; Category = "pilot"; Image = "tech-vulcan.webp"
        cn = @{
            Name = "VT-Vulcan®"; Short = "行泊一体系统"
            Summary = "VT-Vulcan® 是面向智能驾驶的行泊一体决策控制平台，基于域控架构统筹规划、决策与执行，为复杂场景下的车辆控制提供统一计算与控制基础。"
            Features = @(
                @("行泊一体架构", "统一承载行车与泊车场景的计算和控制能力。"),
                @("规划决策控制", "连接感知结果与车辆执行，支持复杂场景下的路径规划与控制。"),
                @("车规级安全设计", "面向量产项目构建安全、可靠的系统架构，具体等级按项目方案配置。")
            )
            Apps = @("行泊一体方案", "智能驾驶域控", "多车型平台适配")
        }
        tw = @{
            Name = "VT-Vulcan®"; Short = "行泊一體系統"
            Summary = "VT-Vulcan® 是面向智能駕駛的行泊一體決策控制平台，基於域控架構統籌規劃、決策與執行，為複雜場景下的車輛控制提供統一運算與控制基礎。"
            Features = @(
                @("行泊一體架構", "統一承載行車與泊車場景的運算和控制能力。"),
                @("規劃決策控制", "連接感知結果與車輛執行，支援複雜場景下的路徑規劃與控制。"),
                @("車規級安全設計", "面向量產專案構建安全、可靠的系統架構，具體等級按專案方案配置。")
            )
            Apps = @("行泊一體方案", "智能駕駛域控", "多車型平台適配")
        }
        en = @{
            Name = "VT-Vulcan®"; Short = "Drive-Park Integrated System"
            Summary = "VT-Vulcan® is an integrated decision and control platform for intelligent driving. Its domain-controller architecture coordinates planning, decision-making and execution for complex driving and parking scenarios."
            Features = @(
                @("Unified drive-park architecture", "Supports computing and control across driving and parking scenarios."),
                @("Planning and control", "Connects perception outputs with vehicle execution for complex maneuvers."),
                @("Automotive-grade design", "Builds a safety-oriented system architecture for production programs.")
            )
            Apps = @("Integrated driving and parking", "Intelligent-driving domain control", "Multi-vehicle platform adaptation")
        }
    },
    @{
        File = "vt-dvr.html"; Category = "cockpit"; Image = "app-cockpit.webp"
        cn = @{
            Name = "VT-DVR"; Short = "行车记录仪"
            Summary = "VT-DVR 面向车载场景提供道路影像记录能力，可与座舱电子方案协同布置，为日常行车和项目定制提供稳定的影像记录支持。"
            Features = @(
                @("行车影像记录", "记录车辆前方道路画面，便于日常查看与事件回溯。"),
                @("座舱一体化集成", "可根据车型内饰与座舱电子架构进行方案适配。"),
                @("车规级稳定设计", "面向车载环境进行可靠性与量产适配。")
            )
            Apps = @("乘用车座舱", "商用车行车记录", "项目定制集成")
        }
        tw = @{
            Name = "VT-DVR"; Short = "行車記錄儀"
            Summary = "VT-DVR 面向車載場景提供道路影像記錄能力，可與座艙電子方案協同佈置，為日常行車和專案定製提供穩定的影像記錄支援。"
            Features = @(
                @("行車影像記錄", "記錄車輛前方道路畫面，便於日常查看與事件回溯。"),
                @("座艙一體化整合", "可根據車型內飾與座艙電子架構進行方案適配。"),
                @("車規級穩定設計", "面向車載環境進行可靠性與量產適配。")
            )
            Apps = @("乘用車座艙", "商用車行車記錄", "專案定製整合")
        }
        en = @{
            Name = "VT-DVR"; Short = "Driving Recorder"
            Summary = "VT-DVR provides in-vehicle road recording and can be integrated with cabin electronics for daily driving, event review and vehicle-specific programs."
            Features = @(
                @("Road recording", "Records the forward road view for daily review and event reference."),
                @("Cabin integration", "Adapts to vehicle interiors and cabin electronics architectures."),
                @("Automotive reliability", "Designed for in-vehicle use and production integration.")
            )
            Apps = @("Passenger-vehicle cabins", "Commercial-vehicle recording", "Custom integration")
        }
    },
    @{
        File = "vt-cms-cv.html"; Category = "cockpit"; Image = "cam-svc-cms.webp"
        cn = @{
            Name = "VT-CMS（商）"; Short = "电子外后视镜"
            Summary = "面向商用车场景，VT-CMS 以摄像头与车内显示屏替代传统光学后视镜，帮助扩展侧后方视野，并改善夜间、雨雾等复杂环境下的观察体验。"
            Features = @(
                @("数字化侧后视野", "通过摄像头采集并显示车辆侧后方画面，减少视野遮挡。"),
                @("复杂环境观察", "针对夜间、雨雾与强光场景进行成像优化。"),
                @("商用车项目适配", "面向客车、卡车等车型开展安装、显示与法规项目适配。")
            )
            Apps = @("客车", "卡车", "雨雾与夜间行车")
        }
        tw = @{
            Name = "VT-CMS（商）"; Short = "電子外後視鏡"
            Summary = "面向商用車場景，VT-CMS 以攝影機與車內顯示螢幕替代傳統光學後視鏡，協助擴展側後方視野，並改善夜間、雨霧等複雜環境下的觀察體驗。"
            Features = @(
                @("數位化側後視野", "透過攝影機採集並顯示車輛側後方畫面，減少視野遮擋。"),
                @("複雜環境觀察", "針對夜間、雨霧與強光場景進行成像優化。"),
                @("商用車專案適配", "面向客車、卡車等車型開展安裝、顯示與法規專案適配。")
            )
            Apps = @("客車", "卡車", "雨霧與夜間行車")
        }
        en = @{
            Name = "VT-CMS (CV)"; Short = "Electronic Side Mirror"
            Summary = "Designed for commercial vehicles, VT-CMS uses cameras and in-cabin displays to expand side-rear visibility and improve observation in rain, fog, low light and strong glare."
            Features = @(
                @("Digital side-rear view", "Captures and displays the area beside and behind the vehicle to reduce obstruction."),
                @("Challenging-environment viewing", "Optimized imaging for night, rain, fog and strong-light conditions."),
                @("Commercial-vehicle integration", "Adapts installation, display and regulatory requirements to buses and trucks.")
            )
            Apps = @("Buses", "Trucks", "Rain, fog and night driving")
        }
    },
    @{
        File = "vt-dms.html"; Category = "cockpit"; Image = "cam-dms.webp"
        cn = @{
            Name = "VT-DMS"; Short = "驾驶员监控"
            Summary = "VT-DMS 通过座舱摄像头持续观察驾驶员面部、视线与头部姿态等状态特征，为疲劳、分心及异常驾驶行为提供识别与预警支持。"
            Features = @(
                @("驾驶状态识别", "结合面部、视线和头部姿态等信息评估驾驶员状态。"),
                @("疲劳与分心预警", "在检测到风险状态时提供视觉或声音提示，具体策略按项目配置。"),
                @("红外低照度感知", "通过红外成像增强夜间和复杂光照条件下的状态捕捉能力。")
            )
            Apps = @("乘用车驾驶安全", "商用车长途驾驶", "车队安全管理")
        }
        tw = @{
            Name = "VT-DMS"; Short = "駕駛員監控"
            Summary = "VT-DMS 透過座艙攝影機持續觀察駕駛員面部、視線與頭部姿態等狀態特徵，為疲勞、分心及異常駕駛行為提供識別與預警支援。"
            Features = @(
                @("駕駛狀態識別", "結合面部、視線和頭部姿態等資訊評估駕駛員狀態。"),
                @("疲勞與分心預警", "在檢測到風險狀態時提供視覺或聲音提示，具體策略按專案配置。"),
                @("紅外低照度感知", "透過紅外成像增強夜間和複雜光照條件下的狀態捕捉能力。")
            )
            Apps = @("乘用車駕駛安全", "商用車長途駕駛", "車隊安全管理")
        }
        en = @{
            Name = "VT-DMS"; Short = "Driver Monitoring"
            Summary = "VT-DMS uses an in-cabin camera to observe facial, gaze and head-pose signals, providing detection and warning support for fatigue, distraction and abnormal driving behavior."
            Features = @(
                @("Driver-state recognition", "Evaluates driver condition using facial, gaze and head-pose information."),
                @("Fatigue and distraction alerts", "Provides visual or audible warnings according to project-specific strategies."),
                @("Infrared low-light perception", "Uses infrared imaging to support monitoring at night and in difficult lighting.")
            )
            Apps = @("Passenger-vehicle safety", "Long-haul commercial driving", "Fleet safety programs")
        }
    },
    @{
        File = "vt-cms-pv.html"; Category = "cockpit"; Image = "cam-svc-cms.webp"
        cn = @{
            Name = "VT-CMS（乘）"; Short = "电子外后视镜"
            Summary = "面向乘用车场景，VT-CMS 通过数字化摄像头和显示屏拓展侧后方视野，并可结合整车造型与座舱方案进行一体化设计。"
            Features = @(
                @("乘用车数字视野", "以摄像头和车内显示屏提供侧后方观察画面。"),
                @("造型与座舱协同", "可围绕整车造型、人机布置和显示界面进行定制。"),
                @("复杂环境成像", "针对夜间、雨雾和强光环境优化可视效果。")
            )
            Apps = @("乘用车", "智能座舱", "车型平台定制")
        }
        tw = @{
            Name = "VT-CMS（乘）"; Short = "電子外後視鏡"
            Summary = "面向乘用車場景，VT-CMS 透過數位化攝影機和顯示螢幕拓展側後方視野，並可結合整車造型與座艙方案進行一體化設計。"
            Features = @(
                @("乘用車數位視野", "以攝影機和車內顯示螢幕提供側後方觀察畫面。"),
                @("造型與座艙協同", "可圍繞整車造型、人機佈置和顯示介面進行定製。"),
                @("複雜環境成像", "針對夜間、雨霧和強光環境優化可視效果。")
            )
            Apps = @("乘用車", "智能座艙", "車型平台定製")
        }
        en = @{
            Name = "VT-CMS (PV)"; Short = "Electronic Side Mirror"
            Summary = "Designed for passenger vehicles, VT-CMS uses digital cameras and displays to expand side-rear visibility and can be integrated with vehicle styling and cabin architecture."
            Features = @(
                @("Digital passenger-vehicle view", "Provides side-rear observation through cameras and in-cabin displays."),
                @("Styling and cabin integration", "Supports customization around vehicle design, human-machine layout and display interfaces."),
                @("Challenging-environment imaging", "Improves visibility at night, in rain and fog, and under strong glare.")
            )
            Apps = @("Passenger vehicles", "Intelligent cabins", "Vehicle-platform customization")
        }
    },
    @{
        File = "vt-smart-lighting.html"; Category = "cockpit"; Image = "app-cockpit.webp"
        cn = @{
            Name = "VT-Smart Lighting"; Short = "智慧照明"
            Summary = "VT-Smart Lighting 面向智能座舱提供场景化照明解决方案，将光学设计、动态光效与交互体验结合，支持迎宾、氛围和音乐律动等应用。"
            Features = @(
                @("舱内光影设计", "通过隧道光、投影灯和柔性光纤等方案营造层次化光效。"),
                @("多模态交互", "支持按项目配置音频、手势与触控等交互方式。"),
                @("个性化场景", "可定制颜色、亮度和动态效果，适配不同车型与座舱风格。")
            )
            Apps = @("迎宾光效", "座舱氛围灯", "音乐律动场景")
        }
        tw = @{
            Name = "VT-Smart Lighting"; Short = "智慧照明"
            Summary = "VT-Smart Lighting 面向智能座艙提供場景化照明解決方案，將光學設計、動態光效與互動體驗結合，支援迎賓、氛圍和音樂律動等應用。"
            Features = @(
                @("艙內光影設計", "透過隧道光、投影燈和柔性光纖等方案營造層次化光效。"),
                @("多模態互動", "支援按專案配置音訊、手勢與觸控等互動方式。"),
                @("個性化場景", "可定製顏色、亮度和動態效果，適配不同車型與座艙風格。")
            )
            Apps = @("迎賓光效", "座艙氛圍燈", "音樂律動場景")
        }
        en = @{
            Name = "VT-Smart Lighting"; Short = "Smart Lighting"
            Summary = "VT-Smart Lighting brings optical design, dynamic light effects and interaction together for intelligent cabin scenarios, including welcome, ambient and music-reactive experiences."
            Features = @(
                @("Cabin light design", "Uses tunnel lighting, projection and flexible fiber solutions to create layered light effects."),
                @("Multimodal interaction", "Supports audio, gesture and touch interaction according to project configuration."),
                @("Personalized scenes", "Customizable color, brightness and dynamic effects for different vehicle and cabin styles.")
            )
            Apps = @("Welcome lighting", "Ambient cabin lighting", "Music-reactive scenes")
        }
    },
    @{
        File = "vt-e-mirror.html"; Category = "cockpit"; Image = "app-cockpit.webp"
        cn = @{
            Name = "VT-E-Mirror"; Short = "流媒体后视镜"
            Summary = "VT-E-Mirror 通过车尾摄像头采集后方画面，并显示在车内后视镜屏幕上，帮助扩展后方视野，改善乘员或货物遮挡以及复杂天气下的观察效果。"
            Features = @(
                @("数字化后方视野", "将摄像头画面显示在车内后视镜，减少车内遮挡影响。"),
                @("复杂环境显示", "针对夜间、雨雾和强光场景优化画面可读性。"),
                @("座舱显示集成", "可根据车型后视镜结构和座舱界面进行适配。")
            )
            Apps = @("乘用车后视", "商用车后视", "满载与遮挡场景")
        }
        tw = @{
            Name = "VT-E-Mirror"; Short = "流媒體後視鏡"
            Summary = "VT-E-Mirror 透過車尾攝影機採集後方畫面，並顯示在車內後視鏡螢幕上，協助擴展後方視野，改善乘員或貨物遮擋以及複雜天氣下的觀察效果。"
            Features = @(
                @("數位化後方視野", "將攝影機畫面顯示在車內後視鏡，減少車內遮擋影響。"),
                @("複雜環境顯示", "針對夜間、雨霧和強光場景優化畫面可讀性。"),
                @("座艙顯示整合", "可根據車型後視鏡結構和座艙介面進行適配。")
            )
            Apps = @("乘用車後視", "商用車後視", "滿載與遮擋場景")
        }
        en = @{
            Name = "VT-E-Mirror"; Short = "Streaming Rearview Mirror"
            Summary = "VT-E-Mirror displays a rear-camera feed on an in-cabin mirror screen, expanding rear visibility when passengers or cargo obstruct the view and in challenging weather."
            Features = @(
                @("Digital rear visibility", "Displays the rear camera feed on the interior mirror to reduce obstruction."),
                @("Challenging-condition display", "Optimizes image readability at night, in rain, fog and strong light."),
                @("Cabin integration", "Adapts to mirror structure and cabin interfaces for different vehicle models.")
            )
            Apps = @("Passenger-vehicle rear vision", "Commercial-vehicle rear vision", "Loaded and obstructed vehicles")
        }
    },
    @{
        File = "vt-hud.html"; Category = "cockpit"; Image = "app-cockpit.webp"
        cn = @{
            Name = "VT-HUD"; Short = "抬头显示"
            Summary = "VT-HUD 将车速、导航和辅助驾驶提示等关键信息投射到驾驶员前方视野，减少视线转移，让重要信息更直观地呈现。"
            Features = @(
                @("关键信息前置", "在驾驶员前方显示车速、导航与辅助提示等重要信息。"),
                @("减少视线转移", "让驾驶者更少低头查看信息，专注前方道路。"),
                @("座舱显示集成", "可根据车型人机布局、显示内容和光学方案进行定制。")
            )
            Apps = @("智能座舱", "辅助驾驶信息显示", "车型平台定制")
        }
        tw = @{
            Name = "VT-HUD"; Short = "抬頭顯示"
            Summary = "VT-HUD 將車速、導航和輔助駕駛提示等關鍵資訊投射到駕駛員前方視野，減少視線轉移，讓重要資訊更直觀地呈現。"
            Features = @(
                @("關鍵資訊前置", "在駕駛員前方顯示車速、導航與輔助提示等重要資訊。"),
                @("減少視線轉移", "讓駕駛者更少低頭查看資訊，專注前方道路。"),
                @("座艙顯示整合", "可根據車型人機佈局、顯示內容和光學方案進行定製。")
            )
            Apps = @("智能座艙", "輔助駕駛資訊顯示", "車型平台定製")
        }
        en = @{
            Name = "VT-HUD"; Short = "Head-Up Display"
            Summary = "VT-HUD projects key information such as speed, navigation and driving-assistance prompts into the driver's forward view, reducing the need to look away from the road."
            Features = @(
                @("Key information ahead", "Displays speed, navigation and assistance prompts in the driver's forward field of view."),
                @("Less gaze diversion", "Reduces the need to look down for important driving information."),
                @("Cabin display integration", "Customizable around vehicle layout, displayed content and optical architecture.")
            )
            Apps = @("Intelligent cabins", "Driving-assistance information", "Vehicle-platform customization")
        }
    }
)

function Write-Utf8File([string]$Path, [string]$Content) {
    $directory = Split-Path -Parent $Path
    if (-not (Test-Path -LiteralPath $directory)) {
        New-Item -ItemType Directory -Path $directory | Out-Null
    }
    [System.IO.File]::WriteAllText($Path, $Content, $utf8)
}

function Get-Prefix([string]$LanguageKey) {
    if ($LanguageKey -eq "cn") { return "" }
    return "../"
}

function Build-Header([string]$LanguageKey, [string]$File) {
    $u = $ui[$LanguageKey]
    $pre = Get-Prefix $LanguageKey
    if ($LanguageKey -eq "cn") {
        $logo = "index.html"
        $langSwitch = '<a href="index.html">简</a><a href="zh-Hant/index.html">繁</a><a href="en/index.html">EN</a>'
    } elseif ($LanguageKey -eq "tw") {
        $logo = "../index.html"
        $langSwitch = '<a href="../index.html">简</a><a href="index.html" class="on">繁</a><a href="../en/index.html">EN</a>'
    } else {
        $logo = "../index.html"
        $langSwitch = '<a href="../index.html">简</a><a href="../zh-Hant/index.html">繁</a><a href="index.html" class="on">EN</a>'
    }
    return @"
<!DOCTYPE html>
<html lang="$(if($LanguageKey -eq 'en'){'en'}elseif($LanguageKey -eq 'tw'){'zh-Hant'}else{'zh-CN'})">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>$($u.Brand) - $($File)</title>
<link rel="stylesheet" href="${pre}assets/css/style.css?v=37">
</head>
<body>
<header class="site-header">
  <div class="wrap header-inner">
    <a class="logo" href="$logo">
      <img loading="lazy" class="logo-img" src="${pre}assets/img/logo-header.webp" alt="$($u.Brand)">
    </a>
    <nav class="nav" id="mainNav">
      <a href="index.html">$($u.Home)</a>
      <a href="about.html">$($u.About)</a>
      <a href="tech.html" class="active">$($u.Tech)</a><span class="has-drop"><a href="agents.html">$($u.Agents)</a><span class="drop"><a href="agents-car.html">$($u.Cars)</a><a href="agents-agri.html">$($u.Agri)</a><a href="agents-lowalt.html">$($u.LowAlt)</a><a href="agents-robot.html">$($u.Robots)</a></span></span>
      <a href="news.html">$($u.News)</a><a href="esg.html">$($u.ESG)</a>
      <a href="join.html">$($u.Join)</a>
      <div class="lang-switch">$langSwitch</div>
    </nav>
    <button class="menu-btn" aria-label="Menu">&#9776;</button>
  </div>
</header>
"@
}

function Build-Footer([string]$LanguageKey) {
    $u = $ui[$LanguageKey]
    $pre = Get-Prefix $LanguageKey
    if ($LanguageKey -eq "cn") {
        $lang = '<a href="index.html">简体中文</a> | <a href="zh-Hant/index.html">繁體中文</a> | <a href="en/index.html">English</a>'
    } elseif ($LanguageKey -eq "tw") {
        $lang = '<a href="../index.html">简体中文</a> | <a href="index.html">繁體中文</a> | <a href="../en/index.html">English</a>'
    } else {
        $lang = '<a href="../index.html">简体中文</a> | <a href="../zh-Hant/index.html">繁體中文</a> | <a href="index.html">English</a>'
    }
    return @"
<footer class="site-footer">
  <div class="wrap">
    <div class="footer-grid">
      <div>
        <h5>$($u.Brand)</h5>
        <p style="margin-top:12px">$($u.QR)</p>
        <img loading="lazy" class="footer-qr" src="${pre}assets/img/qr-wechat.webp" alt="QR">
      </div>
      <div>
        <h5>$($u.Quick)</h5>
        <a href="about.html">$($u.About)</a>
        <a href="tech.html">$($u.Tech)</a>
        <a href="agents.html">$($u.Agents)</a>
        <a href="news.html">$($u.News)</a><a href="esg.html">$($u.ESG)</a>
        <a href="honors.html">$($u.Honors)</a>
        <a href="join.html">$($u.Join)</a>
      </div>
    </div>
    <div class="footer-bottom">
      <span>© 2026 $($u.Brand) VOYISL</span>
      <span>$lang</span>
    </div>
  </div>
</footer>
<script src="${pre}assets/js/main.js"></script>
</body>
</html>
"@
}

function Build-ProductPage([string]$LanguageKey, $Product) {
    $u = $ui[$LanguageKey]
    $copy = $Product[$LanguageKey]
    $category = $categories[$Product.Category][$LanguageKey]
    $pre = Get-Prefix $LanguageKey
    $features = ""
    foreach ($feature in $copy.Features) {
        $features += '<div class="mvv reveal"><span class="tag">' + $copy.Short + '</span><h4>' + $feature[0] + '</h4><p>' + $feature[1] + '</p></div>'
    }
    $apps = ""
    foreach ($app in $copy.Apps) {
        $apps += '<div class="apps-col reveal"><div class="col-ico"><svg viewBox="0 0 24 24" fill="none" stroke-width="1.6"><path d="M12 2 4 6v6c0 4.4 3.4 8.2 8 10 4.6-1.8 8-5.6 8-10V6z"/><path d="m9 12 2 2 4-4.5"/></svg></div><h4>' + $app + '</h4><p>' + $copy.Summary + '</p></div>'
    }
    $related = ""
    foreach ($other in $products) {
        if ($other.Category -eq $Product.Category -and $other.File -ne $Product.File) {
            $otherCopy = $other[$LanguageKey]
            $related += '<a class="agent reveal" href="' + $other.File + '"><h4>' + $otherCopy.Name + '</h4><p>' + $otherCopy.Short + '</p></a>'
        }
    }
    $header = Build-Header $LanguageKey $copy.Name
    $footer = Build-Footer $LanguageKey
    return $header + @"
<section class="page-hero">
  <div class="bg"></div>
  <div class="inner">
    <p class="en">$($category.Name) / $($category.Label)</p>
    <h1>$($copy.Name)</h1>
    <span class="bar"></span>
    <p style="color:#d8d2c8;font-size:15px;letter-spacing:2px;margin-top:20px">$($copy.Short)</p>
  </div>
</section>
<section class="sec" style="background:#fff">
  <div class="wrap">
    <a class="news-back" href="$($category.File)">← $($u.Back) $($category.Name)</a>
    <div class="about-grid">
      <div class="reveal">
        <p class="en">$($u.Overview)</p>
        <h2 style="font-size:28px;margin:8px 0 18px;letter-spacing:2px">$($copy.Name) · $($copy.Short)</h2>
        <p>$($copy.Summary)</p>
        <div class="feat">
          <div><b>$($category.Name)</b>$($category.Label)</div>
          <div><b>VOYISL</b>$($copy.Short)</div>
        </div>
      </div>
      <div class="about-visual reveal">
        <img loading="lazy" src="${pre}assets/img/$($Product.Image)" alt="$($copy.Name)">
      </div>
    </div>
    <div class="sec-head reveal" style="margin-top:64px"><p class="en">Capabilities</p><h2>$($u.Capabilities)</h2><span class="bar"></span></div>
    <div class="mvv-grid">$features</div>
    <div class="sec-head reveal" style="margin-top:64px"><p class="en">Applications</p><h2>$($u.Scenarios)</h2><span class="bar"></span></div>
    <div class="apps-grid">$apps</div>
    <div class="sec-head reveal" style="margin-top:64px"><p class="en">Related Products</p><h2>$($u.Related)</h2><span class="bar"></span></div>
    <div class="agents-grid">$related</div>
    <p class="foot" style="font-size:20px;color:#999;text-align:center;margin-top:28px">$($u.Custom)</p>
    <p style="text-align:center;margin-top:30px"><a class="btn" href="contact.html">$($u.Contact) →</a></p>
  </div>
</section>
$footer
"@
}

function Update-ProductLinks([string]$LanguageKey) {
    $directory = if ($LanguageKey -eq "cn") { $root } else { Join-Path $root $LanguageKey }
    if ($LanguageKey -eq "tw") { $directory = Join-Path $root "zh-Hant" }
    $changed = 0
    foreach ($file in (Get-ChildItem -LiteralPath $directory -File -Filter "*.html")) {
        $text = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
        $original = $text
        foreach ($product in $products) {
            $name = [regex]::Escape($product[$LanguageKey].Name)
            $pattern = '<li><a href="(?:vt-pilot|vt-cockpit)\.html">(' + $name + '[^<]*)</a></li>'
            $replacement = '<li><a href="' + $product.File + '">$1</a></li>'
            $text = [regex]::Replace($text, $pattern, $replacement)
        }
        if ($text -ne $original) {
            [System.IO.File]::WriteAllText($file.FullName, $text, $utf8)
            $changed++
        }
    }
    return $changed
}

$generated = 0
foreach ($language in $languages) {
    $directory = if ($language.Dir) { Join-Path $root $language.Dir } else { $root }
    foreach ($product in $products) {
        $path = Join-Path $directory $product.File
        Write-Utf8File $path (Build-ProductPage $language.Key $product)
        $generated++
    }
    $changed = Update-ProductLinks $language.Key
    Write-Host "$($language.Key): generated $($products.Count) product pages, updated $changed link pages"
}

$inventorySuffix = @{ cn = "cn"; tw = "tw"; en = "en" }
foreach ($language in $languages) {
    $inventory = Join-Path $root (".tmp_apps\apps_" + $inventorySuffix[$language.Key] + ".txt")
    if (Test-Path -LiteralPath $inventory) {
        $linkMap = @{}
        foreach ($product in $products) {
            $linkMap[$product[$language.Key].Name] = $product.File
        }
        $lines = [System.IO.File]::ReadAllLines($inventory, [System.Text.Encoding]::UTF8)
        for ($i = 0; $i -lt $lines.Count; $i++) {
            $parts = $lines[$i].Split("|")
            if ($parts.Count -ge 3 -and $linkMap.ContainsKey($parts[0])) {
                $parts[1] = $linkMap[$parts[0]]
                $lines[$i] = $parts -join "|"
            }
        }
        [System.IO.File]::WriteAllLines($inventory, $lines, $utf8)
    }
}

Write-Host "done: generated $generated product pages"
