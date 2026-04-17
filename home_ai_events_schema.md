# Home AI 打点事件与属性定义

> 本文档定义 Home AI（AI 家装设计 App）的所有埋点事件及事件属性，供系统导入使用。

---

## 一、事件属性定义（Event Properties）

以下属性为全局属性库，事件通过 `property_id` 引用。请先导入属性，再导入事件。

```json
[
  {
    "property_id": "page_name",
    "display_name": "页面名称",
    "data_type": "string",
    "description": "触发事件时所在的页面名称",
    "enum_values": null
  },
  {
    "property_id": "from_page",
    "display_name": "来源页面",
    "data_type": "string",
    "description": "上一级页面名称",
    "enum_values": null
  },
  {
    "property_id": "ab_group",
    "display_name": "实验分组",
    "data_type": "string",
    "description": "A/B 实验分组标识",
    "enum_values": null
  },
  {
    "property_id": "design_style",
    "display_name": "设计风格",
    "data_type": "string",
    "description": "选择的家装设计风格",
    "enum_values": ["现代简约", "北欧", "日式", "中式", "美式", "工业风", "轻奢", "法式", "地中海", "侘寂"]
  },
  {
    "property_id": "room_type",
    "display_name": "房间类型",
    "data_type": "string",
    "description": "设计的房间类型",
    "enum_values": ["客厅", "卧室", "厨房", "卫生间", "书房", "阳台", "餐厅", "儿童房", "玄关"]
  },
  {
    "property_id": "generate_duration",
    "display_name": "生成耗时(ms)",
    "data_type": "number",
    "description": "AI 生成设计图的耗时，单位毫秒",
    "enum_values": null
  },
  {
    "property_id": "fail_reason",
    "display_name": "失败原因",
    "data_type": "string",
    "description": "AI 生成失败的原因分类",
    "enum_values": ["超时", "模型异常", "图片不合规", "参数错误", "服务不可用"]
  },
  {
    "property_id": "model_version",
    "display_name": "生成模型",
    "data_type": "string",
    "description": "AI 生成使用的模型版本标识",
    "enum_values": null
  },
  {
    "property_id": "input_type",
    "display_name": "输入方式",
    "data_type": "string",
    "description": "用户上传房间照片的方式",
    "enum_values": ["拍照", "相册", "户型图", "文字描述"]
  },
  {
    "property_id": "is_regenerate",
    "display_name": "是否重新生成",
    "data_type": "string",
    "description": "本次生成是否为重新生成操作",
    "enum_values": ["是", "否"]
  },
  {
    "property_id": "design_index",
    "display_name": "方案序号",
    "data_type": "number",
    "description": "多方案场景下的方案序号",
    "enum_values": null
  },
  {
    "property_id": "project_id",
    "display_name": "项目 ID",
    "data_type": "string",
    "description": "家装设计项目的唯一标识",
    "enum_values": null
  },
  {
    "property_id": "design_id",
    "display_name": "方案 ID",
    "data_type": "string",
    "description": "AI 生成方案的唯一标识",
    "enum_values": null
  },
  {
    "property_id": "share_channel",
    "display_name": "分享渠道",
    "data_type": "string",
    "description": "分享设计方案到外部的渠道",
    "enum_values": ["微信", "朋友圈", "小红书", "保存图片"]
  },
  {
    "property_id": "download_format",
    "display_name": "下载格式",
    "data_type": "string",
    "description": "下载设计方案的文件格式",
    "enum_values": ["高清图", "对比图", "视频"]
  },
  {
    "property_id": "product_id",
    "display_name": "商品 ID",
    "data_type": "string",
    "description": "App Store / Google Play 商品标识",
    "enum_values": null
  },
  {
    "property_id": "plan_type",
    "display_name": "订阅套餐类型",
    "data_type": "string",
    "description": "用户选择的订阅套餐周期",
    "enum_values": ["周", "月", "年", "终身"]
  },
  {
    "property_id": "price",
    "display_name": "价格",
    "data_type": "number",
    "description": "实际支付金额",
    "enum_values": null
  },
  {
    "property_id": "currency",
    "display_name": "货币",
    "data_type": "string",
    "description": "支付使用的货币类型",
    "enum_values": ["CNY", "USD"]
  },
  {
    "property_id": "paywall_source",
    "display_name": "付费墙来源",
    "data_type": "string",
    "description": "触发付费墙的功能来源",
    "enum_values": ["AI生成限制", "高清下载", "去水印", "风格解锁", "设置页"]
  }
]
```

---

## 二、一般事件定义（Events）

每个事件的 `properties` 字段引用上方属性的 `property_id`。

```json
[
  {
    "event_id": "app_start",
    "display_name": "应用启动",
    "app": "Home AI",
    "category": "交互行为",
    "trigger": "客户端",
    "status": "已上线",
    "description": "用户打开 App 时触发",
    "properties": ["page_name", "from_page", "ab_group"]
  },
  {
    "event_id": "page_view",
    "display_name": "页面浏览",
    "app": "Home AI",
    "category": "页面浏览",
    "trigger": "客户端",
    "status": "已上线",
    "description": "进入任意页面时触发",
    "properties": ["page_name", "from_page", "ab_group"]
  },
  {
    "event_id": "project_create",
    "display_name": "创建项目",
    "app": "Home AI",
    "category": "业务转化",
    "trigger": "客户端",
    "status": "已上线",
    "description": "新建家装设计项目时触发",
    "properties": ["room_type", "project_id", "page_name", "from_page"]
  },
  {
    "event_id": "photo_upload",
    "display_name": "上传照片",
    "app": "Home AI",
    "category": "交互行为",
    "trigger": "客户端",
    "status": "已上线",
    "description": "上传房间照片或户型图时触发",
    "properties": ["input_type", "room_type", "project_id", "page_name", "from_page"]
  },
  {
    "event_id": "ai_generate_start",
    "display_name": "AI 生成发起",
    "app": "Home AI",
    "category": "业务转化",
    "trigger": "客户端",
    "status": "已上线",
    "description": "点击开始设计/生成按钮时触发",
    "properties": ["design_style", "room_type", "input_type", "is_regenerate", "model_version", "project_id", "page_name", "ab_group"]
  },
  {
    "event_id": "ai_generate_complete",
    "display_name": "AI 生成完成",
    "app": "Home AI",
    "category": "业务转化",
    "trigger": "服务端",
    "status": "已上线",
    "description": "AI 出图成功返回时触发",
    "properties": ["design_style", "room_type", "generate_duration", "model_version", "design_index", "project_id", "page_name", "ab_group"]
  },
  {
    "event_id": "ai_generate_fail",
    "display_name": "AI 生成失败",
    "app": "Home AI",
    "category": "业务转化",
    "trigger": "服务端",
    "status": "已上线",
    "description": "AI 出图失败时触发",
    "properties": ["fail_reason", "model_version", "room_type", "page_name", "ab_group"]
  },
  {
    "event_id": "style_select",
    "display_name": "风格选择",
    "app": "Home AI",
    "category": "交互行为",
    "trigger": "客户端",
    "status": "已上线",
    "description": "选择设计风格时触发",
    "properties": ["design_style", "project_id", "page_name", "from_page"]
  },
  {
    "event_id": "room_type_select",
    "display_name": "房间类型选择",
    "app": "Home AI",
    "category": "交互行为",
    "trigger": "客户端",
    "status": "已上线",
    "description": "选择房间类型时触发",
    "properties": ["room_type", "project_id", "page_name", "from_page"]
  },
  {
    "event_id": "design_view",
    "display_name": "方案浏览",
    "app": "Home AI",
    "category": "页面浏览",
    "trigger": "客户端",
    "status": "已上线",
    "description": "查看 AI 生成的设计方案时触发",
    "properties": ["design_id", "design_style", "room_type", "page_name", "from_page"]
  },
  {
    "event_id": "design_favorite",
    "display_name": "方案收藏",
    "app": "Home AI",
    "category": "交互行为",
    "trigger": "客户端",
    "status": "已上线",
    "description": "收藏设计方案时触发",
    "properties": ["design_id", "design_style", "room_type", "page_name"]
  },
  {
    "event_id": "design_download",
    "display_name": "方案下载",
    "app": "Home AI",
    "category": "交互行为",
    "trigger": "客户端",
    "status": "已上线",
    "description": "下载设计图时触发",
    "properties": ["design_id", "download_format", "design_style", "room_type", "page_name"]
  },
  {
    "event_id": "design_share",
    "display_name": "方案分享",
    "app": "Home AI",
    "category": "交互行为",
    "trigger": "客户端",
    "status": "已上线",
    "description": "分享设计方案到外部时触发",
    "properties": ["design_id", "share_channel", "design_style", "room_type", "page_name"]
  },
  {
    "event_id": "param_adjust",
    "display_name": "参数调整",
    "app": "Home AI",
    "category": "交互行为",
    "trigger": "客户端",
    "status": "已上线",
    "description": "修改设计参数后重新生成时触发",
    "properties": ["design_style", "room_type", "project_id", "page_name"]
  },
  {
    "event_id": "paywall_view",
    "display_name": "订阅页曝光",
    "app": "Home AI",
    "category": "业务转化",
    "trigger": "客户端",
    "status": "已上线",
    "description": "进入订阅/付费页面时触发",
    "properties": ["paywall_source", "page_name", "from_page", "ab_group"]
  },
  {
    "event_id": "purchase_start",
    "display_name": "订阅发起",
    "app": "Home AI",
    "category": "业务转化",
    "trigger": "客户端",
    "status": "已上线",
    "description": "点击订阅/购买按钮时触发",
    "properties": ["product_id", "plan_type", "price", "currency", "paywall_source", "page_name"]
  },
  {
    "event_id": "purchase_complete",
    "display_name": "订阅成功",
    "app": "Home AI",
    "category": "业务转化",
    "trigger": "服务端",
    "status": "已上线",
    "description": "支付成功回调时触发",
    "properties": ["product_id", "plan_type", "price", "currency", "paywall_source", "page_name"]
  },
  {
    "event_id": "purchase_restore",
    "display_name": "订阅恢复",
    "app": "Home AI",
    "category": "业务转化",
    "trigger": "客户端",
    "status": "已上线",
    "description": "恢复购买时触发",
    "properties": ["product_id", "plan_type", "page_name"]
  },
  {
    "event_id": "onboarding_complete",
    "display_name": "引导页完成",
    "app": "Home AI",
    "category": "交互行为",
    "trigger": "客户端",
    "status": "已上线",
    "description": "完成新手引导流程时触发",
    "properties": ["page_name", "from_page", "ab_group"]
  },
  {
    "event_id": "feature_click",
    "display_name": "功能点击",
    "app": "Home AI",
    "category": "交互行为",
    "trigger": "客户端",
    "status": "已上线",
    "description": "点击功能入口时触发（通用兜底）",
    "properties": ["page_name", "from_page", "ab_group"]
  }
]
```

---

## 三、导入说明

### 导入顺序

1. **先导入事件属性** — 属性是全局定义，事件通过 `property_id` 引用
2. **再导入事件** — 事件的 `properties` 数组中每个值对应属性的 `property_id`

### 字段说明

| 字段 | 说明 |
|------|------|
| `event_id` | 事件唯一标识，用于 SDK 上报 |
| `display_name` | 事件在后台的中文显示名 |
| `app` | 所属产品，固定为 `Home AI` |
| `category` | 事件分类：`交互行为` / `页面浏览` / `业务转化` |
| `trigger` | 触发端：`客户端` 或 `服务端` |
| `status` | 事件状态：`已上线` / `已停用` |
| `properties` | 该事件关联的属性 ID 列表 |
| `property_id` | 属性唯一标识 |
| `data_type` | 数据类型：`string` / `number` |
| `enum_values` | 枚举值列表，`null` 表示自由输入 |
