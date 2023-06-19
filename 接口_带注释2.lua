--====================================================================================================================================================================================
                                                --前置函数模块
wenro = {--LingRen函数

  -- 将表转换为字符串
  table_to_string = function(tbl)
    local result = "{\n"
    for k, v in pairs(tbl) do
      local s = "[" .. tostring(k) .. "] = " .. tostring(v) .. ""
      result = result .. s .. ",\n "
    end
    result = result:sub(1, -3)
    return result .. "\n}"
  end,

  -- 搜索指定数值
  search = function(a, b)
    gg.searchNumber(a, b)
  end,

  -- 查找并添加数值到列表
  py1 = function(x, py, lx, py1, lx2, mz)
    local tmp = {}
    for k, v in ipairs(gg.getResults(gg.getResultsCount())) do
      local value = gg.getValues({{address = v.address + py, flags = lx}})
      if value[1].value == x then
        tmp[#tmp + 1] = value[1]
      end
    end
    if not tmp[1] then
      return false
    end
    gg.loadResults(tmp)
    local escs = gg.getResults(gg.getResultsCount())
    add = {}
    add[1] = {address = escs[1].address + py1, flags = lx2, name = mz}
    gg.addListItems(add)
    addr = gg.getValues({{address = escs[1].address + py1, flags = lx2}})[1].address
    gg.clearResults()
    return addr
  end,

  -- 将表转换为字符串（与上面的函数重复了）
  table_to_string2 = function(tbl)
    local result = "{\n"
    for k, v in pairs(tbl) do
      local s = "[" .. tostring(k) .. "] = " .. tostring(v) .. ""
      result = result .. s .. ",\n "
    end
    result = result:sub(1, -3)
    return result .. "\n}"
  end,

  -- 获取字节并转换为字符串
  get_byte = function(v, num, add, name, py, value)
    if value == nil then
      value = 0
    end
    addr = {}
    addr2 = {}
    for i = 1, num do
      addr[i] = {address = add + i - 1 + (v - 1) * py, flags = 1}
    end
    addr = gg.getValues(addr)
    name = ""
    for i = 1, #addr do
      if addr[i].value == 0 then
        break
      end
      if addr[i].value >= 0 then
        name = name .. string.char(addr[i].value)
      else
      end
    end
    table.insert(addr2, name)
  end,

  -- 将表转换为字符串（与上面的函数重复了）
  table_to_string2 = function(tbl)
    local result = "{\n"
    for k, v in pairs(tbl) do
      local s = "[" .. tostring(k) .. "] = " .. tostring(v) .. ""
      result = result .. s .. ",\n "
    end
    result = result:sub(1, -3)
    return result .. "\n}"
  end,
}

bh = ""

-- 执行指定的方法
function doAction(method)
  load(method .. "()")()
end

-- 选择并执行方法
function MOM0choice(cd, name)
  tmp = {}
  for k, v in pairs(cd) do
    tmp[#tmp + 1] = {}
    tmp[#tmp] = cd[k][1]
  end
  SN = gg.choice(tmp, nil, name)
  if SN then
    doAction(cd[SN][2])
  end
end
--==================================================================================================================================================================
header = {} -- 存储请求头的表
-- header["Host"] = 'beta.radiance.thatgamecompany.com' -- 请求的主机地址
header["User-Agent"] = "Sky-Test-com.tgc.sky.androi.test.gold/0.20.5.629145 (OnePlus KB2000; android 31.0.0; zh)" -- 用户代理标识
header["X-Session-ID"] = xses -- 会话ID
header["Content-Type"] = 'application/json' -- 请求的内容类型
-- header["trace-id"] = 'Xggsbj' -- 追踪ID
header["user-id"] = uer -- 用户ID
header["session"] = sess -- 会话信息
header["x-sky-level-id"] = "3526133726" -- Sky等级ID
--====================================================================================================================================================================================
function trace() -- 随机令牌生成函数
  local letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  local randomString = ""
  local letterCount = 0
  for i = 1, 7 do
    if math.random() < 0.5 and letterCount < 2 then
      randomString = randomString .. string.sub(letters, math.random(#letters), math.random(#letters))
      letterCount = letterCount + 1
    else
      randomString = randomString .. tostring(math.random(0, 9))
    end
  end
  return randomString -- 返回生成的随机令牌字符串
end
--==========================================================================================================================================================================================================================================
                                                              -- 测试功能模块
function jjks()
  -- 设置请求的URL
  URL = "" .. fwq .. "/account/set_achievement_stats"
  -- 设置请求的参数体
  body = [[
  {"user":"]] .. uer .. [[","session":"]] .. sess .. [[","achievement_stats":[{"type":"pants_change_count","value":9949494949494994}]}]]
  -- 设置请求头的Content-Length
  header["Content-Length"] = #body
  -- 发送请求并获取返回内容
  Content = gg['makeRequest'](URL, header, body).content
  -- 弹出返回内容
  gg.alert(Content)
end

function testt()
  -- 设置请求的URL
  URL = "" .. fwq .. "/account/purchase_spirit_shop_item"
  -- 设置请求的参数体
  body = [[
  {"user":"]] .. uer .. [[","session":"]] .. sess .. [[","unlock_id":2231097150,"item_name":"CharSkyKid_Hair_AP03Umbrella_01","spirit_id":1372682856,"cs_end":false}]]
  -- 设置请求头的Content-Length
  header["Content-Length"] = #body
  -- 发送请求并获取返回内容
  Content = gg['makeRequest'](URL, header, body).content
  -- 弹出返回内容
  gg.alert(Content)
end

function scp()
  -- 设置请求的URL
  URL = "" .. fwq .. "/account/get_unlocks"
  -- 设置请求的参数体
  body = [[
  {"user":"]] .. uer .. [[","session":"]] .. sess .. [["}]]
  -- 设置请求头的Content-Length
  header["Content-Length"] = #body
  -- 发送请求并获取返回内容
  Content = gg['makeRequest'](URL, header, body).content
  -- 打开文件并写入返回内容
  local f = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/" .. os.date("%m月%d日 %H;%M;%S", os.time()) .. "unlo信息.lua", "a+")
  f:write(Content)
  f:close()
end

function xzcs()
  -- 设置请求的URL
  URL = "" .. fwq .. "/account/get_collectibles"
  -- 设置请求的参数体
  body = [[
  {"user":"]] .. uer .. [[","session":"]] .. sess .. [["}]]
  -- 设置请求头的Content-Length
  header["Content-Length"] = #body
  -- 发送请求并获取返回内容
  Content = gg['makeRequest'](URL, header, body).content
  -- 打开文件并写入返回内容
  local f = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/" .. os.date("%m月%d日 %H;%M;%S", os.time()) .. "unlo信息.lua", "a+")
  f:write(Content)
  f:close()
  -- 弹出返回内容
  gg.alert(Content)
end

function cs()
  -- 设置请求的URL
  URL = "https://dev.radiance.thatgamecompany.com/service/status/api/v1/get_unlocks"
  -- 设置请求的参数体
  body = [[
  {"user":"e3e7d633-fa5a-4d66-83a5-2281c2e5266d","session":"347fa6235fa0bd8d1ca4e0c30af588a7"}]]
  -- 设置请求头的Content-Length
  header["Content-Length"] = #body
  -- 发送请求并获取返回内容
  Content = gg['makeRequest'](URL, header, body).content
  -- 弹出返回内容
  gg.alert(Content)
end

function hysj()
  -- 设置请求的URL
  URL = "" .. fwq .. "/account/get_blocked_friends"
  -- 设置请求的参数体
  body = [[
  {"user":"]] .. uer .. [[","session":"]] .. sess .. [[","page_max":1,"page_offset":0}]]
  -- 设置请求头的Content-Length
  header["Content-Length"] = #body
  -- 发送请求并获取返回内容
  Content1 = gg['makeRequest'](URL, header, body).content
  -- 设置请求的URL
  URL = "" .. fwq .. "/account/get_friend_statues"
  -- 设置请求的参数体
  body = [[
  {"user":"e3e7d633-fa5a-4d66-83a5-2281c2e5266d","session":"0f882ef9756e20fc5003f8ce9f428e19","max":150,"sort_ver":1}]]
  -- 设置请求头的Content-Length
  header["Content-Length"] = #body
  -- 发送请求并获取返回内容
  Content = gg['makeRequest'](URL, header, body).content
  -- 打开文件并写入返回内容
  local f = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/" .. os.date("%m月%d日 %H;%M;%S", os.time()) .. "好友信息.lua", "a+")
  f:write(Content)
  f:close()
  -- 弹出返回内容
  gg.alert(Content)
end

function hymk()
  hysy = gg.prompt({"货币名称"})
  hyid = hysy[1]
  -- 设置请求的URL
  URL = "" .. fwq .. "/account/set_friend_block"
  -- 设置请求的参数体
  body = [[
  {"user":"]] .. uer .. [[","session":"]] .. sess .. [[","friend":"]] .. hyid .. [[","blocked":true}]]
  -- 设置请求头的Content-Length
  header["Content-Length"] = #body
  -- 发送请求并获取返回内容
  Content = gg['makeRequest'](URL, header, body).content
  -- 弹出返回内容
  gg.alert(Content)
end

function outfit()
  -- 设置请求的URL
  URL = "" .. fwq .. "/account/set_outfit"
  -- 设置请求的参数体
  body = [[
  {"user":"]] .. uer .. [[","session":"]] .. sess .. [[","outfit":{"body":{"id":3691343236,"tex":0,"pat":0,"mask":0},"wing":{"id":2245279351,"tex":0,"pat":0,"mask":0},"hair":{"id":158418233,"tex":0,"pat":0,"mask":0},"mask":{"id":3663390882,"tex":0,"pat":0,"mask":0},"neck":{"id":3800884691,"tex":0,"pat":0,"mask":0},"feet":{"id":0,"tex":0,"pat":0,"mask":0},"horn":{"id":3680499229,"tex":0,"pat":0,"mask":0},"arms":{"id":0,"tex":0,"pat":0,"mask":0},"prop":{"id":2035109393,"tex":0,"pat":0,"mask":0},"height":0.41260627,"scale":-0.070615329,"voice":0,"attitude":0,"seed":56984}}]]
  -- 设置请求头的Content-Length
  header["Content-Length"] = #body
  -- 发送请求并获取返回内容
  Content = gg['makeRequest'](URL, header, body).content
  -- 弹出返回内容
  gg.alert(Content)
end

function hymz()
  hymz = gg.prompt({"好友id"})
  hyid = hymz[1]
  hy = gg.prompt({"好友mz"})
  hyzm = hy[1]
  -- 设置请求的URL
  URL = "" .. fwq .. "/account/set_friend_name"
  -- 设置请求的参数体
  body = [[
  {"user":"]] .. uer .. [[","session":"]] .. sess .. [[","friend":"]] .. hyid .. [[","name":"]] .. hyzm .. [["}]]
  -- 设置请求头的Content-Length
  header["Content-Length"] = #body
  -- 发送请求并获取返回内容
  Content = gg['makeRequest'](URL, header, body).content
  -- 弹出返回内容
  gg.alert(Content)
end

















--============================================================================================================================================================================================================================================================
-- 完善功能模块

function hbtj()
  -- 货币修改
  currtype = gg.prompt({"货币名称"}) -- 提示用户输入货币名称
  type = currtype[1] -- 获取用户输入的货币名称
  input = gg.prompt({"数量"}) -- 提示用户输入数量
  buynum = input[1] -- 获取用户输入的数量
  URL = ""..fwq.."/account/add_currency" -- 构造请求的URL
  body = [[
    {"user":"]]..uer..[[","session":"]]..sess..[[","currency":{"]]..type..[[":]]..buynum..[[}}
  ]] -- 构造请求的body
  header["Content-Length"] = #body -- 设置请求头的Content-Length字段
  Content = gg['makeRequest'](URL, header, body).content -- 发起请求并获取响应内容
  gg.alert(Content) -- 弹出响应内容的提示框
end
--================================================================================================================================================
function rwmk()
  -- 任务信息获取
  URL = ""..fwq.."/account/get_season_quests" -- 构造请求的URL
  body = [[
    {"user":"]]..uer..[[","session":"]]..sess..[["}
  ]] -- 构造请求的body
  header["Content-Length"] = #body -- 设置请求头的Content-Length字段
  Content = gg['makeRequest'](URL, header, body).content -- 发起请求并获取响应内容
  local f = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/任务信息.lua", "a+") -- 打开文件以追加写入响应内容
  f:write(Content) -- 写入响应内容
  f:close() -- 关闭文件
  gg.alert(Content) -- 弹出响应内容的提示框
end
--================================================================================================================================================
function gyhq()
  -- 光翼获取
  body = [[
    {"user":"]]..uer..[[","session":"]]..sess..[[","names":["l_DuskOasis_0","s_manta","s_shrug",...]}
  ]] -- 构造请求的body
  URL = ""..fwq.."/account/wing_buffs/collect" -- 构造请求的URL
  Content = gg['makeRequest'](URL, header, body).content -- 发起请求并获取响应内容
end
--================================================================================================================================================
function xj()
  -- 献祭模块
  oo = gg.prompt({"献祭次数"}) -- 提示用户输入献祭次数
  o = oo[1] -- 获取用户输入的献祭次数
  u = 0
  for g = 1, 100 do
    wingID = '[["l_DuskOasis_0",0],["s_manta",0],["s_shrug",0],["s_playfight",0],...]' -- 设置光翼ID
    -- 这里省略了一些代码...
  end
end
--================================================================================================================================================
function xj() -- 献祭模块
  oo = gg.prompt({"献祭次数"}) -- 提示用户输入献祭次数
  o = oo[1] -- 获取用户输入的次数
  u = 0 -- 初始化计数器
  for g = 1, 100 do -- 进行100次循环
      wingID = '[["l_DuskOasis_0",0],["s_manta",0],["s_shrug",0],["s_playfight",0],["s_marching",0],["l_NightDesert_1",0],["l_RainMid_0",0],["l_SunsetVillage_2",0],["s_peek",0],["l_Dawn_1",0],["s_handstand_02",0],["l_Prairie_Island_2",0],["l_DuskGraveyard_0",0],["l_Sunset_Citadel_0",0],["s_butterfly",0],["l_Rain_Cave_3",0],["s_bellyscratch",0],["l_Dusk_CrabField_0",0],["l_Prairie_NestAndKeeper_0",0],["l_Prairie_Village_1",0],["l_DayHubCave_0",0],["l_Sunset_YetiPark_0",0],["s_spintrick",0],["s_shy",0],["l_Prairie_Cave_0",0],["l_RainForest_2",0],["l_Rain_0",0],["l_RainShelter_1",0],["l_Prairie_ButterflyFields_1",0],["s_nod",0],["s_ohno",0],["l_Dawn_TrialsAir_0",0],["l_DuskEnd_0",0],["l_Night_1",0],["s_come",0],["s_tsktsk",0],["l_Prairie_ButterflyFields_2",0],["l_Rain_1",0],["l_Dawn_TrialsWater_0",0],["s_cheer",0],["l_SunsetRace_0",0],["s_cold",0],["s_wave",0],["l_Prairie_Cave_1",0],["s_loopdance",0],["s_brave_02",0],["s_dontgo",0],["s_wise",0],["l_Dawn_2",0],["l_RainMid_2",0],["l_Night2_0",0],["l_Storm_8",0],["s_seek",0],["s_rally",0],["l_Dawn_3",0],["s_scare",0],["s_float",0],["s_eww",0],["l_SunsetVillage_0",0],["s_welcome",0],["s_proud",0],["l_Rain_Cave_2",0],["l_Rain_BaseCamp_1",0],["s_pray_02",0],["l_StormStart_0",0],["l_Night2_2",0],["s_crabwalk",0],["l_NightArchive_0",0],["s_dustoff",0],["l_SunsetEnd_0",0],["l_Sunset_1",0],["l_Dusk_1",0],["s_pout",0],["s_cry",0],["l_SunsetColosseum_0",0],["l_Storm_4",0],["s_grumpy",0],["l_Night_0",0],["l_Rain_Cave_0",0],["s_die",0],["s_whale",0],["l_Prairie_Village_4",0],["l_DuskGraveyard_4",0],["l_Night2_1",0],["s_salute",0],["l_NightArchive_1",0],["l_Dawn_4",0],["l_Prairie_Village_3",0],["s_wave_02",0],["l_Dusk_Triangle_1",0],["l_DuskGraveyard_1",0],["s_pray",0],["l_Credits_0",0],["l_DuskMid_1",0],["l_Rain_Cave_1",0],["l_RainMid_1",0],["l_Sunset_Citadel_1",0],["s_laugh",0],["s_nothanks",0],["s_cry_02",0],["s_bearhug",0],["s_ghost",0],["s_timid",0],["s_gratitude",0],["s_juggle",0],["l_Dawn_TrialsFire_0",0],["s_force",0],["l_Dusk_CrabField_1",0],["l_Prairie_Island_4",0],["l_Sunset_FlyRace_0",0],["l_Sunset_YetiPark_1",0],["l_RainForest_1",0],["l_Prairie_Village_0",0],["l_Sunset_FlyRace_1",0],["l_DuskGraveyard_5",0],["l_Sunset_0",0],["s_respect",0],["s_sarcastic",0],["s_scared",0],["l_Skyway_0",0],["s_strong",0],["l_Rain_BaseCamp_0",0],["s_chestpound",0],["s_think",0],["l_Prairie_Island_6",0],["s_sparkler",0],["s_carry",0],["l_Night2_3",0],["l_Storm_1",0],["s_seek_02",0],["l_Storm_2",0],["l_SunsetEnd2_0",0],["l_Prairie_Island_7",0],["s_lazycool",0],["s_backflip",0],["l_Prairie_Island_3",0],["l_Prairie_Village_2",0],["s_crabvoice",0],["s_proud_02",0],["l_NightDesert_2",0],["l_Prairie_NestAndKeeper_1",0],["s_chuckle",0],["l_Dusk_Triangle_0",0],["l_Storm_5",0],["s_joy",0],["l_Dawn_0",0],["l_Storm_6",0],["s_acknowledge",0],["l_RainShelter_0",0],["s_handstand",0],["s_jelly",0],["l_Storm_0",0],["s_ohno_02",0],["s_showdance",0],["s_bubbles",0],["s_kungfu",0],["l_Dusk_0",0],["s_beacon",0],["s_doze",0],["s_tripleaxel",0],["l_Prairie_ButterflyFields_0",0],["l_DuskMid_0",0],["s_sneaky",0],["l_DuskGraveyard_2",0],["s_facepalm",0],["l_Dusk_CrabField_2",0],["s_sorry",0],["l_Prairie_Island_5",0],["s_salutation",0],["l_Prairie_Island_0",0],["l_RainForest_3",0],["l_Sunset_2",0],["l_SunsetEnd_1",0],["l_RainForest_0",0],["s_bow",0],["l_Storm_7",0],["s_thumbsup",0],["s_bird",0],["l_SunsetVillage_1",0],["l_Storm_3",0],["s_doublefive",0],["l_Prairie_Island_1",0],["s_hairtousle",0],["s_butterfly_02",0],["s_deepbreath",0],["l_DuskGraveyard_3",0],["s_yawn",0],["s_dance",0],["l_CandleSpace_0",0],["s_lookaround",0],["l_RainEnd_0",0],["s_sass",0],["s_love",0],["s_brave",0],["l_NightDesert_0",0],["l_Dawn_TrialsEarth_0",0],["s_celebrate",0],["s_balance",0],["s_kiss",0],["s_shh",0],["s_wipe",0],["s_pout_02",0],["s_point",0],["l_DuskOasis_1",0],["l_StormEvent_VoidSpace_0",0],["l_StormEvent_VoidSpace_1",0],["l_StormEvent_VoidSpace_2",0],["l_StormEvent_VoidSpace_3",0],["l_StormEvent_VoidSpace_4",0],["l_StormEvent_VoidSpace_5",0],["s_scheme",0],["s_slouch",0],["s_gloat",0],["s_stretch",0],["s_beckon",0],["s_sneeze",0],["l_AP16SoftInside_0",0],["l_AP16SoftInside_1",0],["l_AP16SoftInside_2",0],["l_AP16SoftInside_3",0],["l_AP16Warrior_0",0],["l_AP16Warrior_1",0]]' -- 设置翅膀ID
      URL = "" .. fwq .. "/account/wing_buffs/deposit" -- 设置请求URL
      body = [[{"user":"]] .. uer .. [[","session":"]] .. sess .. [[","name_deposit_id_pairs":]] .. wingID .. [[}]] -- 设置请求体
      header["Content-Length"] = #body -- 设置请求头内容长度
      Content2 = gg['makeRequest'](URL, header, body).content -- 发送请求并获取响应内容
      URL = "" .. fwq .. "/account/wing_buffs/convert" -- 设置请求URL
      body = [[{"user":"]] .. uer .. [[","session":"]] .. sess .. [[["}]] -- 设置请求体
      header["Content-Length"] = #body -- 设置请求头内容长度
      Content3 = gg['makeRequest'](URL, header, body).content -- 发送请求并获取响应内容
      gyhq() -- 调用函数gyhq()
      gg.toast("循环:" .. g .. "设置:" .. o) -- 显示循环和设置的次数
      if Content3 == "" then
          break -- 如果Content3为空，则退出循环
      end
      if g == o then
          break -- 如果循环次数达到设置的次数，则退出循环
      end
  end
  if g == nil then
      g = "循环错误" -- 如果g为nil，则设置g为"循环错误"
  end
  gg.alert("循环次数:" .. o) -- 弹出提示框显示循环次数
end
--==================================================================================================================================================================
function lbgm() -- 自定义礼包购买
  dm = gg.prompt({"礼包代码"}) -- 提示用户输入礼包代码
  iap = dm[1] -- 获取用户输入的礼包代码
  URL = "" .. fwq .. "/account/commerce/receipt" -- 设置请求URL
  body = [[{"user":"]] .. uer .. [[","session":"]] .. sess .. [[","platform":"fake","receipt":"com.tgc.sky.androi.test.gold.]] .. iap .. [[","target_pid":"]] .. iap .. [[","target_uid":"]] .. uer .. [[","restore":false}]] -- 设置请求体
  header["Content-Length"] = #body -- 设置请求头内容长度
  Content = gg['makeRequest'](URL, header, body).content -- 发送请求并获取响应内容
  os.remove("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/购买信息.lua") -- 删除指定路径下的文件
  local f = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/购买信息.lua", "a+") -- 打开文件，以追加方式写入内容
  f:write(Content) -- 将响应内容写入文件
  f:close() -- 关闭文件
  gg.alert(Content) -- 弹出提示框显示响应内容
end
--=================================================================================================================================================================================
function jlxh() -- 季蜡循环
  dm = gg.prompt({"次数"}) -- 提示用户输入次数
  s = dm[1] -- 获取用户输入的次数
  for g = 1, 200 do -- 进行200次循环
      URL = "" .. fwq .. "/account/commerce/receipt" -- 设置请求URL
      body = [[{"user":"]] .. uer .. [[","session":"]] .. sess .. [[","platform":"fake","receipt":"com.tgc.sky.androi.test.gold.SPASSR","target_pid":"SPASSR","target_uid":"]] .. uer .. [[","restore":false}]] -- 设置请求体
      header["Content-Length"] = #body -- 设置请求头内容长度
      Content = gg['makeRequest'](URL, header, body).content -- 发送请求并获取响应内容
      if g == s then
          break -- 如果循环次数达到设置的次数，则退出循环
      end
  end
  gg.alert("循环次数:" .. s) -- 弹出提示框显示循环次数
end
--==============================================================================================================================
function csg() -- 恢复码获取信息
  dm = gg.prompt({"输入恢复码"}) -- 提示用户输入恢复码
  hcm = dm[1] -- 获取用户输入的恢复码
  URL = "" .. fwq .. "/account/get_remote_outfit" -- 设置请求URL
  body = [[{"user":"]] .. uer .. [[","session":"]] .. sess .. [[","target":"]] .. hcm .. [["}]] -- 设置请求体
  header["Content-Length"] = #body -- 设置请求头内容长度
  Content = gg['makeRequest'](URL, header, body).content -- 发送请求并获取响应内容
  gg.alert(Content) -- 弹出提示框显示响应内容
end
--======================================================================================================================================================================================================

                                        --账号信息模块

function yxxxgx() -- 在线获取信息函数
    top = {} -- 顶层表
    for i = 1, 1 do -- 循环
        top[i] = {} -- 为每个索引创建一个子表
        wenro.seach(":X-Session-ID", 1) -- 搜索字符串中包含":X-Session-ID"的内容
        xx1 = wenro.py1(115, 0x4, 1, -0x4, 1, "信息1") -- 调用py1函数，获取信息1的值
        wenro.get_byte(i, 36, xx1 + 0xE, "xx1", 0x0) -- 调用get_byte函数，获取指定位置的字节值并赋给xx1
        top[i].xses = addr2[1] -- 将addr2表的第一个值赋给top[i]表的xses字段
        xses = top[i].xses -- 将xses字段的值赋给全局变量xses
        wenro.seach(":user-id", 1) -- 搜索字符串中包含":user-id"的内容
        xx2 = wenro.py1(45, 0x4, 1, -0x4, 1, "信息2") -- 调用py1函数，获取信息2的值
        wenro.get_byte(i, 36, xx2 + 9, "xx1", 0x0) -- 调用get_byte函数，获取指定位置的字节值并赋给xx1
        top[i].uer = addr2[1] -- 将addr2表的第一个值赋给top[i]表的uer字段
        uer = top[i].uer -- 将uer字段的值赋给全局变量uer
        wenro.seach(":session", 1) -- 搜索字符串中包含":session"的内容
        xx3 = wenro.py1(105, 0x4, 1, -0x4, 1, "信息3") -- 调用py1函数，获取信息3的值
        wenro.get_byte(i, 32, xx3 + 10, "xx1", 0x0) -- 调用get_byte函数，获取指定位置的字节值并赋给xx1
        top[i].sess = addr2[1] -- 将addr2表的第一个值赋给top[i]表的sess字段
        sess = top[i].sess -- 将sess字段的值赋给全局变量sess
    end
    os.remove("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/xses信息.lua") -- 删除文件
    local f = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/xses信息.lua", "a+") -- 打开文件以追加写入模式
    f:write(xses) -- 将xses写入文件
    f:close() -- 关闭文件
    os.remove("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/uer信息.lua") -- 删除文件
    local f = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/uer信息.lua", "a+") -- 打开文件以追加写入模式
    f:write(uer) -- 将uer写入文件
    f:close() -- 关闭文件
    os.remove("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/seass信息.lua") -- 删除文件
    local f = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/seass信息.lua", "a+") -- 打开文件以追加写入模式
    f:write(sess) -- 将sess写入文件
    f:close() -- 关闭文件
    Main() -- 调用Main函数
    cdsx() -- 调用cdsx函数
    doAction(FX) -- 调用doAction函数并传入FX参数
end

--================================================================================================================================================
--================================================================================================================================================
--aa = gg.prompt({"alid"})
--a = aa[1]

function xxdxxs() -- 单个修改信息函数
    xx = gg.prompt({"xsessid"}) -- 弹出对话框，获取xsessid的值
    x = xx[1] -- 将xsessid的值赋给变量x
    os.remove("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/xses信息.lua") -- 删除文件
    local f = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/xses信息.lua", "a+") -- 打开文件以追加写入模式
    f:write(x) -- 将x写入文件
    f:close() -- 关闭文件
end

function xxdxue()
    uu = gg.prompt({"userid"}) -- 弹出对话框，获取userid的值
    u = uu[1] -- 将userid的值赋给变量u
    os.remove("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/uer信息.lua") -- 删除文件
    local f = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/uer信息.lua", "a+") -- 打开文件以追加写入模式
    f:write(u) -- 将u写入文件
    f:close() -- 关闭文件
end

function xxdxse()
    ss = gg.prompt({"seassionid"}) -- 弹出对话框，获取seassionid的值
    s = ss[1] -- 将seassionid的值赋给变量s
    os.remove("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/seass信息.lua") -- 删除文件
    local f = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/seass信息.lua", "a+") -- 打开文件以追加写入模式
    f:write(s) -- 将s写入文件
    f:close() -- 关闭文件
end

--os.remove("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/al信息.lua")
--local f = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/al信息.lua", "a+")
--f:write(a)
--f:close()

function xxdxfwq()
    fw = gg.prompt({"服务器类型"}) -- 弹出对话框，获取服务器类型的值
    ff = fw[1] -- 将服务器类型的值赋给变量ff
    os.remove("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据//信息/服务器信息.lua") -- 删除文件
    local f = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/服务器信息.lua", "a+") -- 打开文件以追加写入模式
    f:write(ff) -- 将ff写入文件
    f:close() -- 关闭文件
end
--==================================================================================================================================================================
function dlxx() -- 定义函数dlxx（外置登录）
  cs = gg.prompt({"登录信息"}) -- 弹出输入框，获取登录信息
  zhx = cs[1] -- 将登录信息保存在变量zhx中
  kk = '\''..zhx..'\'' -- 构造kk变量，格式化登录信息
  inpuid =  kk:match("id\":\"(.-)\",") -- 从登录信息中匹配id字段并保存在变量inpuid中
  signid = kk:match("token\":\"(.-)\"}") -- 从登录信息中匹配token字段并保存在变量signid中
  al = kk:match("alias\":\"(.-)\",") -- 从登录信息中匹配alias字段并保存在变量al中
  -- zh = gg.prompt({"账号类型"}) -- 弹出输入框，获取账号类型（注释掉，未被使用）
  -- lx = zh[1] -- 将账号类型保存在变量lx中（注释掉，未被使用）

  if al == "" then -- 如果alias为空
      URL = ""..fwq.."/account/auth/login" -- 构造URL变量，设置为指定地址
      body = [[{"type":"Nintendo","external_credentials":{"external_account_type":"Nintendo","player_id":"]]..inpuid..[[","key_url":"","signature":"]]..signid..[[","salt":"","timestamp":0,"alias":""},"user":"00000000-0000-0000-0000-000000000000","device":"00000000-0000-0000-0000-000000000000","key":"0000000000000000000000000000000000000000000000000000000000000000","device_name":"Redmi Note 11 5G","device_token":"ceURsRayLMhaSnKW11UurA:APA91bH_tw2qkgFQHbEx5AF4R8SL4F9JtOyQS9FYqk0fHcCHxCEiROptpKS0lKKqaMFk7MbbWKegkGSnuZJrkCANl7CvyPsvhqwSYYMP8m2W9eGPnHySqTU998-mAyMJAXovTKnCEJGi","production":true,"tos_version":4,"device_key":"A4LikxRTWOrmHTXcmIhd9HXqPSPH+UsD7pNLrll1ye4u","sig_ts":1676795401,"sig":"MEQCIGUCb6i9t2nInjhVuo3kgQ3WXwU9gqTFYep8UL6YZP9hAiAKuiwUeLVMwkBFPktzcNui8OUBPlWnNTn7hpwMw6WTeg==","hashes":[1135420871,1354495595,3253250988,755750522,2750919814,3559282153,2862836767,1334682523,3062676827,3714531524,2766223387,2397429037,3830172889,4289683175,989130031,3923110752,884461435,2669125820,997949458,1810499009,3661381049,174921029,750514053,2052251523,3942768312,1079831624],"":false}]] -- 设置body变量为指定值
  else -- 否则
      URL = ""..fwq.."/account/auth/login" -- 构造URL变量，设置为指定地址
      body = [[{"type":"Huawei","external_credentials":{"external_account_type":"Huawei","player_id":"]]..inpuid..[[","key_url":"","signature":"]]..signid..[[","salt":"","timestamp":0,"alias":"]]..al..[["},"user":"00000000-0000-0000-0000-000000000000","device":"00000000-0000-0000-0000-000000000000","key":"0000000000000000000000000000000000000000000000000000000000000000","device_name":"Redmi Note 11 5G","device_token":"ceURsRayLMhaSnKW11UurA:APA91bH_tw2qkgFQHbEx5AF4R8SL4F9JtOyQS9FYqk0fHcCHxCEiROptpKS0lKKqaMFk7MbbWKegkGSnuZJrkCANl7CvyPsvhqwSYYMP8m2W9eGPnHySqTU998-mAyMJAXovTKnCEJGi","production":true,"tos_version":4,"device_key":"A4LikxRTWOrmHTXcmIhd9HXqPSPH+UsD7pNLrll1ye4u","sig_ts":1676795401,"sig":"MEQCIGUCb6i9t2nInjhVuo3kgQ3WXwU9gqTFYep8UL6YZP9hAiAKuiwUeLVMwkBFPktzcNui8OUBPlWnNTn7hpwMw6WTeg==","hashes":[1135420871,1354495595,3253250988,755750522,2750919814,3559282153,2862836767,1334682523,3062676827,3714531524,2766223387,2397429037,3830172889,4289683175,989130031,3923110752,884461435,2669125820,997949458,1810499009,3661381049,174921029,750514053,2052251523,3942768312,1079831624],"":false}]] -- 设置body变量为指定值
  end
  -- body = [[{"type":"Nintendo","external_credentials":{"external_account_type":"Nintendo","key_url":"","player_id":"]]..login..[[","timestamp":0,"salt":""},"user":"00000000-0000-0000-0000-000000000000","device":"00000000-0000-0000-0000-000000000000","key":"0000000000000000000000000000000000000000000000000000000000000000","device_name":"Redmi Note 11 5G","device_token":"ceURsRayLMhaSnKW11UurA:APA91bH_tw2qkgFQHbEx5AF4R8SL4F9JtOyQS9FYqk0fHcCHxCEiROptpKS0lKKqaMFk7MbbWKegkGSnuZJrkCANl7CvyPsvhqwSYYMP8m2W9eGPnHySqTU998-mAyMJAXovTKnCEJGi","production":true,"tos_version":4,"device_key":"A4LikxRTWOrmHTXcmIhd9HXqPSPH+UsD7pNLrll1ye4u","sig_ts":1676795401,"sig":"MEQCIGUCb6i9t2nInjhVuo3kgQ3WXwU9gqTFYep8UL6YZP9hAiAKuiwUeLVMwkBFPktzcNui8OUBPlWnNTn7hpwMw6WTeg==","hashes":[1135420871,1354495595,3253250988,755750522,2750919814,3559282153,2862836767,1334682523,3062676827,3714531524,2766223387,2397429037,3830172889,4289683175,989130031,3923110752,884461435,2669125820,997949458,1810499009,3661381049,174921029,750514053,2052251523,3942768312,1079831624],"":false}]] -- body变量未被使用，注释掉

  header["Content-Length"] = #body -- 设置header表中的Content-Length字段为body的长度
  Content = gg['makeRequest'](URL,header,body).content -- 使用makeRequest函数发送请求并保存响应内容在Content变量中
  os.remove("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/登录信息.lua") -- 删除指定路径下的文件
  local f = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/登录信息.lua", "a+") -- 打开指定路径下的文件，以追加方式
  f:write(Content) -- 将Content变量的内容写入文件
  f:close() -- 关闭文件

  t = '\''..Content..'\'' -- 构造t变量，格式化Content变量的内容
  u = t:match("user\":\"(.-)\",") -- 从t中匹配user字段并保存在变量u中
  os.remove("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/uer信息.lua") -- 删除指定路径下的文件
  local f = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/uer信息.lua", "a+") -- 打开指定路径下的文件，以追加方式
  f:write(u) -- 将u变量的内容写入文件
  f:close() -- 关闭文件

  s = t:match("session\":\"(.-)\",") -- 从t中匹配session字段并保存在变量s中
  os.remove("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/seass信息.lua") -- 删除指定路径下的文件
  local f = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/seass信息.lua", "a+") -- 打开指定路径下的文件，以追加方式
  f:write(s) -- 将s变量的内容写入文件
  f:close() -- 关闭文件

  Main() -- 调用Main函数
  cdsx() -- 调用cdsx函数
  doAction(FX) -- 调用doAction函数，并传递参数FX
end
--============================================================================================================--
                                        --游戏信息模块
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
function yjhqxx()--一键获取
lb()
dhs()
smss()
sjc()
gqxx()
gg.alert("全部信息完成")
end
--==============================================================================================================================
function hbdq()--货币信息
  URL = ""..fwq.."/account/get_currency" -- 货币信息的URL
  body = [[{"user":"]]..uer..[[","session":"]]..sess..[["}]] -- 货币信息的请求体
  header["Content-Length"] = #body -- 设置请求头的Content-Length字段
  Content = gg['makeRequest'](URL, header, body).content -- 发起网络请求并获取返回内容
  os.remove("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/当前货币信息.lua") -- 删除文件（如果存在）
  local f = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/当前货币信息.lua", "a+") -- 打开文件，追加写入内容
  f:write(Content) -- 写入内容到文件
  f:close() -- 关闭文件
  gg.alert(Content) -- 显示弹窗提示返回内容
end
--================================================================================================================================================
function sjc()--时间戳获取
  URL = ""..fwq.."/account/get_event_schedule" -- 时间戳获取的URL
  body = [[{"user":"]]..uer..[[","session":"]]..sess..[["}]] -- 时间戳获取的请求体
  header["Content-Length"] = #body -- 设置请求头的Content-Length字段
  Content = gg['makeRequest'](URL, header, body).content -- 发起网络请求并获取返回内容
  Content = Content:gsub(":", ",") -- 替换返回内容中的冒号
  Content = Content:gsub("%[", "{") -- 替换返回内容中的左方括号
  Content = Content:gsub("%]", "}") -- 替换返回内容中的右方括号

  output_table, tb = {}, {} -- 初始化输出表和临时表

  function convert_time_table(input_table)
      if type(input_table) ~= "table" then
          return input_table
      end
      for i, v in ipairs(input_table) do
          if type(v) == "table" then
              tb = v -- 将临时表设置为当前表
          elseif i % 2 == 1 then
              output_table["\""..v.."\""] = input_table[i + 1] -- 将表中的键值对存入输出表
          end
      end
      var = {}
      for i, v in pairs(tb) do
          if i == 8 then
              var = v -- 获取特定键的值
          end
      end
      for k, w in ipairs(var) do
          output_table[k] = {} -- 初始化嵌套表
          for q, e in ipairs(w) do
              if q % 2 == 1 then
                  output_table[k][e] = w[q + 1] -- 将嵌套表中的键值对存入输出表
              end
          end
      end
  end

  table_to_string2 = function(tbl)
      local result = "{\n"
      for k, v in pairs(tbl) do
          local s = ""
          s = "[" .. tostring(k) .. "] = " .. tostring(v).."," -- 将键值对转换为字符串格式
          result = result .. string.gsub(s, "%-%- table%(%w+%)", "") .. "\n" -- 将特定字符串替换为空
      end
      result = result:sub(1, -3)
      return result .. "\n}"
  end

  str = load("return "..Content)() -- 将字符串转换为Lua代码并执行，获取返回值
  convert_time_table(str) -- 处理时间表
  io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/"..bh.."/"..os.date("%m月%d日-%H-%M-%S", os.time()).."时间戳.lua", "a+"):write(table_to_string2(output_table)) -- 将处理后的时间戳信息写入文件
  --gg.alert(Content)
  gg.toast("时间戳信息完成") -- 显示提示信息
end
--============================================================================================================
function smss()--徽章信息
  URL = ""..fwq.."/account/star/get" -- 徽章信息的URL
  body = [[{"user":"]]..uer..[[","session":"]]..sess..[["}]] -- 徽章信息的请求体
  header["Content-Length"] = #body -- 设置请求头的Content-Length字段
  Content = gg['makeRequest'](URL, header, body).content -- 发起网络请求并获取返回内容
  -- 将逗号替换为换行符
  Content = string.gsub(Content, ",", "\n        ")
  Content = string.gsub(Content, "},", "},\n        ")
  Content = string.gsub(Content, "}", "\n        },")
  Content = string.gsub(Content, ":%[{", ":\n    {")
  Content = string.gsub(Content, "}}", "")
  Content = string.gsub(Content, "{{", "")

  local f = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/"..bh.."/"..os.date("%m月%d日-%H-%M-%S", os.time()).."徽章信息.lua", "a+") -- 打开文件，追加写入内容
  f:write(Content) -- 写入内容到文件
  f:close() -- 关闭文件
  --gg.alert(Content)
  gg.toast("徽章信息完成") -- 显示提示信息
end
--==================================================================================================================================================================
function gqxx()--商店信息
  URL = ""..fwq.."/account/get_generic_shops" -- 商店信息的URL
  body = [[{"user":"]]..uer..[[","session":"]]..sess..[["}]] -- 请求体，包含用户和会话信息
  header["Content-Length"] = #body -- 设置请求头中的Content-Length字段
  Content = gg['makeRequest'](URL,header,body).content -- 发送请求并获取响应内容
  Content=Content:gsub(":",",") -- 将响应内容中的冒号替换为逗号
  Content=Content:gsub("%[","{") -- 将响应内容中的左方括号替换为左花括号
  Content=Content:gsub("%]","}") -- 将响应内容中的右方括号替换为右花括号

  output_table,tb = {},{} -- 定义输出表和临时表

  -- 递归函数，用于将输入的表转换为输出表
  function convert_table(input_table)
      if type(input_table) ~= "table" then
          return input_table
      end
      for i, v in ipairs(input_table) do
          if i == 2 then
              tb = v
          elseif i == 1 then
              day_table = "\""..v.."\""
          else
              if i % 2 == 1  then
                  output_table["\""..v.."\""] = convert_table(input_table[i+1])
              end
          end
      end
      var = {}
      output_table[day_table]={}
      for i, v in pairs(tb) do
          output_table[day_table][i]={}
          var=v
          for k,w in ipairs(var) do
              if k % 2 == 1  then
                  output_table[day_table][i][w] = var[k+1]
              end
          end
      end
  end

  -- 将表转换为字符串
  table_to_string2 = function (tbl)
      local result = "{\n"
      for k, v in pairs(tbl) do
          local s = ""
          s = "[" .. tostring(k) .. "] = " .. tostring(v)..","
          result = result .. string.gsub(s, "%-%- table%(%w+%)", "") .. "\n"
      end
      result = result:sub(1, -3)
      return result .. "\n}"
  end

  str = load("return "..Content)() -- 解析响应内容为Lua表
  convert_table(str) -- 转换表结构
  io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/"..bh.."/"..os.date("%m月%d日-%H-%M-%S",os.time()).."商店兑换信息.lua","a+"):write(table_to_string2(output_table)) -- 将转换后的表写入文件
  gg.toast("商店信息完成") -- 显示提示信息
end

function lb()--礼包信息
  URL=""..fwq.."/account/iaplist" -- 礼包信息的URL
  body = [[{"user":"]]..uer..[[","session":"]]..sess..[[","platform":"fake","country":"US"}]] -- 请求体，包含用户、会话、平台和国家信息
  header["Content-Length"] = #body -- 设置请求头中的Content-Length字段
  Content = gg['makeRequest'](URL,header,body).content -- 发送请求并获取响应内容

    -- 将逗号替换为换行符
    Content = string.gsub(Content, ",", "\n        ")
    Content = string.gsub(Content, "]}", "]\n        },")
    Content = string.gsub(Content, ":%[{", ":\n    {")
    Content = string.gsub(Content, "}}", "")
    Content = string.gsub(Content, "{{", "")

  -- 将内容写入文件
  local f = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/"..bh.."/"..os.date("%m月%d日-%H-%M-%S",os.time()).."礼包信息.lua", "a+")
  f:write(Content)
  f:close()

  gg.toast("礼包信息完成") -- 显示提示信息
end

function dhs()--兑换树信息
  URL=""..fwq.."/account/get_spirit_shops" -- 兑换树信息的URL
  body = [[{"user":"]]..uer..[[","session":"]]..sess..[["}]] -- 请求体，包含用户和会话信息
  header["Content-Length"] = #body -- 设置请求头中的Content-Length字段
  Content = gg['makeRequest'](URL,header,body).content -- 发送请求并获取响应内容
  Content=Content:gsub(":",",") -- 将响应内容中的冒号替换为逗号
  Content=Content:gsub("%[","{") -- 将响应内容中的左方括号替换为左花括号
  Content=Content:gsub("%]","}") -- 将响应内容中的右方括号替换为右花括号

  output_table,tb = {},{} -- 定义输出表和临时表

  -- 递归函数，用于将输入的表转换为输出表
  function convert_table(input_table)
      if type(input_table) ~= "table" then
          return input_table
      end
      for i, v in ipairs(input_table) do
          if i == 2 then
              tb = v
          elseif i == 1 then
              day_table = "\""..v.."\""
          else
              if i % 2 == 1  then
                  output_table["\""..v.."\""] = convert_table(input_table[i+1])
              end
          end
      end
      var = {}
      output_table[day_table]={}
      for i, v in pairs(tb) do
          output_table[day_table][i]={}
          var=v
          for k,w in ipairs(var) do
              if k % 2 == 1  then
                  output_table[day_table][i][w] = convert_table(var[k+1])
              end
          end
      end
  end

  -- 将表转换为字符串
  table_to_string2 = function (tbl)
      local result = "{\n"
      for k, v in pairs(tbl) do
          local s = ""
          s = "[" .. tostring(k) .. "] = " .. tostring(v)..","
          result = result .. string.gsub(s, "%-%- table%(%w+%)", "") .. "\n"
      end
      result = result:sub(1, -3)
      return result .. "\n}"
  end

  str = load("return "..Content)() -- 解析响应内容为Lua表
  convert_table(str) -- 转换表结构
  io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/"..bh.."/"..os.date("%m月%d日-%H-%M-%S",os.time()).."先祖兑换树.lua","a+"):write(table_to_string2(output_table)) -- 将转换后的表写入文件
  gg.toast("兑换树信息完成") -- 显示提示信息
end
--====================================================================================================================================================================================
function bbhxx() -- 定义函数 bbhxx，用于获取服务器版本号
  zero = {} -- 创建一个空表 zero
  ve = {} -- 创建一个空表 ve

  -- 设置不同服务器的 URL
  zero[1] = "https://dev.radiance.thatgamecompany.com/account/get_latest_build_version"
  zero[2] = "https://beta.radiance.thatgamecompany.com/account/get_latest_build_version"
  zero[3] = "https://live.radiance.thatgamecompany.com/account/get_latest_build_version"
  zero[4] = "https://deoooo.radiance.thatgamecompany.com/account/get_latest_build_version"
  zero[5] = "https://de.radiance.thatgamecompany.com/account/get_latest_build_version"
  zero[6] = "https://alpha.radiance.thatgamecompany.com/account/get_latest_build_version"

  for i = 1, 6 do -- 循环 1 到 6
      if i == 1 then
          URL = zero[1] -- 如果 i 为 1，则使用 zero 表中的第一个 URL
      elseif i == 2 then
          URL = zero[2] -- 如果 i 为 2，则使用 zero 表中的第二个 URL
      elseif i == 3 then
          URL = zero[3] -- 如果 i 为 3，则使用 zero 表中的第三个 URL
      end
      --elseif i == 4 then URL = zero[4] elseif i == 5 then URL = zero[5] elseif i == 6 then URL = zero[6] end

      body = [[{}]] -- 请求体为一个空的 JSON 对象
      header["Content-Length"] = #body -- 设置请求头的 Content-Length 字段为请求体的长度
      Content = gg['makeRequest'](URL, header, body).content -- 发起请求并获取返回的内容
      ve[i] = Content -- 将内容保存到 ve 表中的第 i 个位置
  end

  -- 弹出对话框显示服务器版本号
  gg.alert(ve[1])
  gg.alert(ve[2])
  gg.alert(ve[3])
  -- gg.alert(ve[4])
  -- gg.alert(ve[5])
  -- gg.alert(ve[6])
end

function mote() -- 定义函数 mote，用于获取服务器版本号
  zero = {} -- 创建一个空表 zero
  ve = {} -- 创建一个空表 ve

  -- 设置不同服务器的 URL
  zero[1] = "https://dev.radiance.thatgamecompany.com/account/get_motd"
  zero[2] = "https://beta.radiance.thatgamecompany.com/account/get_motd"
  zero[3] = "https://live.radiance.thatgamecompany.com/account/get_motd"
  zero[4] = "https://deoooo.radiance.thatgamecompany.com/account/get_motd"
  zero[5] = "https://de.radiance.thatgamecompany.com/account/get_motd"
  zero[6] = "https://alpha.radiance.thatgamecompany.com/account/get_motd"

  for i = 1, 6 do -- 循环 1 到 6
      if i == 1 then
          URL = zero[1] -- 如果 i 为 1，则使用 zero 表中的第一个 URL
      elseif i == 2 then
          URL = zero[2] -- 如果 i 为 2，则使用 zero 表中的第二个 URL
      elseif i == 3 then
          URL = zero[3] -- 如果 i 为 3，则使用 zero 表中的第三个 URL
      end
      --elseif i == 4 then URL = zero[4] elseif i == 5 then URL = zero[5] elseif i == 6 then URL = zero[6] end

      body = [[{}]] -- 请求体为一个空的 JSON 对象
      header["Content-Length"] = #body -- 设置请求头的 Content-Length 字段为请求体的长度
      Content = gg['makeRequest'](URL, header, body).content -- 发起请求并获取返回的内容
      ve[i] = Content -- 将内容保存到 ve 表中的第 i 个位置
  end

  -- 弹出对话框显示服务器版本号
  gg.alert(ve[1])
  gg.alert(ve[2])
  gg.alert(ve[3])
  -- gg.alert(ve[4])
  -- gg.alert(ve[5])
  -- gg.alert(ve[6])
end

--============================================================================--
                                    --菜单总模块
function cdsx()--菜单刷新
    sjbt = "🙁" 
    -- 设置表情符号为"🙁"
    
    -- 读取文件/seass信息.lua的内容并赋值给变量sess
    file = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/seass信息.lua", "r")
    sess = file:read("*a")
    
    -- 读取文件/uer信息.lua的内容并赋值给变量uer
    filee = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/uer信息.lua", "r")
    uer = filee:read("*a")
    
    -- 读取文件/xses信息.lua的内容并赋值给变量xses
    filel = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/xses信息.lua", "r")
    xses = filel:read("*a")
    
    -- 读取文件/服务器信息.lua的内容并赋值给变量fff
    filet = io.open("C:/Users/凌刃/Desktop/LingRen/LingRen/接口数据/信息/服务器信息.lua", "r")
    fff = filet:read("*a")
    
    -- 根据fff的值选择不同的服务器地址和请求头Host
    if fff == "d" then
        fwq = "https://dev.radiance.thatgamecompany.com"
        header["Host"] = 'dev.radiance.thatgamecompany.com'
    elseif fff == "b" then
        fwq = "https://beta.radiance.thatgamecompany.com"
        header["Host"] = 'beta.radiance.thatgamecompany.com'
    elseif fff == "l" then
        fwq = "https://live.radiance.thatgamecompany.com"
        header["Host"] = 'live.radiance.thatgamecompany.com'
    else
        fwq = "https://test.radiance.thatgamecompany.com"
        header["Host"] = 'test.radiance.thatgamecompany.com'
    end
    
    -- 根据fff的值选择不同的服务器名称
    if fff == "d" then
        bh = "dev"
    elseif fff == "b" then
        bh = "测试服"
    elseif fff == "l" then
        bh = "国际服"
    end
    
    -- 主菜单选项
    Maincd = {
        {sjbt.."登录外部信息"..sjbt, "dlxx"},
        {sjbt.."版本号信息"..sjbt, "bbhxx"},
        {sjbt.."一键获取更新"..sjbt, "yjhqxx"},
        {sjbt.."更改账号信息"..sjbt, "zhxxx"},
        {sjbt.."获取信息菜单"..sjbt, "xxhqd"},
        {sjbt.."账号操作"..sjbt, "zhcz"},
        {sjbt.."测试菜单"..sjbt, "cscs"},
        {sjbt.."恢复码查询"..sjbt, "csg"},
        { "退出","os.exit"}
    }
    
    -- 更改账号信息菜单选项
    zhxxxcd = {
        {sjbt.."登录外部信息"..sjbt, "dlxx"},
        {sjbt.."获取数据更新"..sjbt, "yxxxgx"},
        {sjbt.."xses更新"..sjbt, "xxdxxs"},
        {sjbt.."uer更新"..sjbt, "xxdxue"},
        {sjbt.."sess更新"..sjbt, "xxdxse"},
        {sjbt.."服务器更新"..sjbt, "xxdxfwq"},
        { "上一页","Main"}
    }
    
    -- 获取信息菜单选项
    xxhqdcd = {
        {sjbt.."礼包信息"..sjbt, "lb"},
        {sjbt.."兑换树"..sjbt, "dhs"},
        --{sjbt.."兑换树2"..sjbt, "dhs2"},
        {sjbt.."徽章信息"..sjbt, "smss"},
        {sjbt.."时间戳获取"..sjbt, "sjc"},
        {sjbt.."商店信息"..sjbt, "gqxx"},
        { "上一页","Main"}
    }
    
    -- 账号操作菜单选项
    zhczcd = {
        {sjbt.."货币读取"..sjbt, "hbdq"},
        {sjbt.."货币数量修改"..sjbt, "hbtj"},
        {sjbt.."光翼获取"..sjbt, "gyhq"},
        {sjbt.."献祭"..sjbt, "xj"},
        {sjbt.."季蜡循环"..sjbt, "jlxh"},
        {sjbt.."礼包购买"..sjbt, "lbgm"},
        {sjbt.."好友拉黑"..sjbt, "hymk"},
        { "上一页","Main"}
    }
    
    -- 测试菜单选项
    cscscd = {
        {sjbt.."ack"..sjbt, "outfit"},
        {sjbt.."季节测试"..sjbt, "mote"},
        {sjbt.."季节测试"..sjbt, "cs"},
        {sjbt.."测试收藏品"..sjbt, "scp"},
        {sjbt.."测试先祖品"..sjbt, "xzcs"},
        {sjbt.."好友"..sjbt, "hymz"},
        { "上一页","Main"}
    }
end

-- 主函数，显示主菜单
function Main()
    FX = "Main"
    MOM0choice(Maincd, "凌刃酱提醒你,当前服务器为" .. fff .. "")
end

-- 菜单选项：测试菜单
function cscs()
    FX = "cscs"
    MOM0choice(cscscd, "凌刃酱提醒你,当前服务器为" .. fff .. "")
end

-- 菜单选项：更改账号信息
function zhxxx()
    FX = "zhxxx"
    MOM0choice(zhxxxcd, "服务器" .. fff .. "\n账号:" .. uer .. "\n验证sess:" .. sess .. "\nX令牌:" .. xses .. "")
end

-- 菜单选项：账号操作
function zhcz()
    FX = "zhcz"
    MOM0choice(zhczcd, "服务器" .. fff .. "\n账号:" .. uer .. "\nX令牌:" .. xses .. "")
end

-- 菜单选项：获取信息菜单
function xxhqd()
    FX = "xxhqd"
    URL = "" .. fwq .. "/account/get_currency"
    body = [[
    {"user":"]] .. uer .. [[","session":"]] .. sess .. [["}
    ]]
    header["Content-Length"] = #body
    Content = gg['makeRequest'](URL, header, body).content
    if Content == "" then
        x = "账号信息已过期"
    else
        x = "账号信息可用"
    end
    MOM0choice(xxhqdcd, "" .. x .. "")
end

FX = "Main"
while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        cdsx()
        doAction(FX)
        header["trace-id"] = trace()
    end
end
