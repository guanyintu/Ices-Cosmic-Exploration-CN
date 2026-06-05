# Ices Cosmic Exploration CN (ICE)

源码仓库：`https://github.com/guanyintu/Ices-Cosmic-Exploration-CN`

Dalamud 自定义插件仓库地址：

`https://raw.githubusercontent.com/guanyintu/Ices-Cosmic-Exploration-CN/Main-Branch/pluginmaster.json`

这是 ICE 的国服维护与中文适配分支。上游功能逻辑尽量保持原样，本分支主要负责国服环境适配、中文界面文本、发布维护和必要的构建修复。

这是一个面向宇宙探索（月球）内容的自动化辅助插件，用来减少重复刷任务的时间成本。  
主要目标是帮助你高效刷取宇宙探索任务：无论是全任务金奖、宇宙工具经验，还是各职业 50 万职业技巧点，都可以通过配置后自动执行。

<img width="621" height="394" alt="image" src="https://github.com/user-attachments/assets/722c3e44-74d2-49d3-964a-de21e6a2cf87" />

功能特性：  
✔️ 自动重置任务，直到出现你想刷的目标任务  
✔️ 提供“宇宙工具经验优先”模式，自动选择更适合当前工具升级的任务  
✔️ 可配置任务交付目标（铜/银/金），按你设定的完成标准交付  
✔️ 支持职业优先级与任务类型优先级（天气/限时/连锁）轮转刷取

依赖说明：

### 制作
- Artisan | 仓库：`https://github.com/PunishXIV/Artisan`

### 钓鱼
- AutoHook | 仓库：`https://github.com/InitialDet/AutoHook`
- 自动接受收藏品说明：`https://github.com/PunishXIV/AutoHook/blob/main/AcceptCollectable.md`

### 采集
- 需要 Navmesh
- vnavmesh | 仓库：`https://github.com/awgil/ffxiv_navmesh`

插件内置帮助页会说明各模式与前置要求，也提供依赖插件的一键跳转安装入口。

## 维护说明

- 上游项目：`https://github.com/LeontopodiumNivale14/Ices-Cosmic-Exploration`
- 国服维护：`guanyintu`
- Codex 参与：协助上游合并、冲突处理、中文文本整理、构建验证与发布流程配置。

本分支不声明原创上游逻辑；功能实现以原作者和上游贡献者为基础，中文维护与国服适配由本分支继续整理。
