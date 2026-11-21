# Chest Cavity 简体中文汉化

[![Minecraft](https://img.shields.io/badge/Minecraft-1.16.2%20~%201.20.1-62b47a)](https://www.minecraft.net/)
[![Chest Cavity](https://img.shields.io/badge/Chest%20Cavity-2.10%20~%202.17-c0392b)](https://modrinth.com/mod/chest-cavity)
[![License](https://img.shields.io/badge/License-CC0--1.0-lightgrey)](LICENSE)

[Chest Cavity（胸腔）](https://modrinth.com/mod/chest-cavity) 的简体中文汉化，共 **371 个键**，覆盖 **1.16.2 ~ 1.20.1** 全部已发布分支。

> Chest Cavity 本体**无官方中文**，本汉化已提交到 CFPA，审核通过后可通过i18n拉取。

## 下载

| 游戏版本 | 资源包格式 | 下载 |
|---|---|---|
| 1.20 – 1.20.1 | 15 | [`dist/ChestCavity-zh_cn-1.20.1.zip`](dist/ChestCavity-zh_cn-1.20.1.zip) |
| 1.19 – 1.19.2 | 9 | [`dist/ChestCavity-zh_cn-1.19.zip`](dist/ChestCavity-zh_cn-1.19.zip) |
| 1.18 – 1.18.2 | 8 | [`dist/ChestCavity-zh_cn-1.18.zip`](dist/ChestCavity-zh_cn-1.18.zip) |
| 1.16.2 – 1.16.5 | 6 | [`dist/ChestCavity-zh_cn-1.16.zip`](dist/ChestCavity-zh_cn-1.16.zip) |

四个包里的 `zh_cn.json` **完全相同**（371 键的并集），只是 `pack.mcmeta` 的格式号不同。
多出来的键在旧版本会被忽略，不会报错。

## 安装

1. 把对应版本的 zip 放进 `.minecraft/resourcepacks/`（不要解压）；
2. 游戏内 **选项 → 资源包**，把它移到右侧启用；
3. 完成。中文界面下即刻生效，无需重启。

> 资源包与加载器无关，Fabric 与 Forge 版都可以直接使用，不需要任何额外依赖。

## 内容说明

覆盖范围：物品名、状态效果、附魔与描述、按键绑定、器官评分、品质词、配置界面、死亡消息、REI 分类。
其中器官评分的 tooltip 做了本地化改写，例如英文 `Good Strength` 对应中文 `力量：优秀`。

术语约定：

| 英文 | 中文 | 说明 |
|---|---|---|
| Chest Cavity / Organ | 胸腔 / 器官 | 模组名与可安装物件 |
| Organ Rejection | 排异反应 | 移植医学术语 |
| Organ Meat | 脏器肉 | 与可安装的「器官」区分 |
| Rich Sausage | 浓郁香肠 | 因使用脏器肉制作，考虑可能指气味浓郁 |
| Crystalsynthesis | 晶合作用 | 仿「光合作用」，指靠末地水晶充能 |
| Hydroallergenic / Hydrophobia | 恐水过敏 / 恐水症 | 前者掉血，后者传送逃跑 |

### 已知限制

- 有 8 处英文是**硬编码在 Java 里**的（`Text.literal(...)`），资源包无法翻译，最显眼的是每件器官 tooltip 最后的 `Safe to Use`；
- `batet/luss/vuld_cleaver` 与 `cannibal_heart` 等 5 个物品在**任何版本里都没有注册代码**（只有贴图/模型），译文已保留但游戏中不会出现。

## 仓库结构

```
.
├── pack.mcmeta                            # 1.20.1 用（根目录本身就是一个可用资源包）
├── pack.png
├── assets/chestcavity/lang/zh_cn.json     # 371 键，唯一的事实来源
├── dist/                                  # 构建产物（按版本打好的 zip）
├── i18n/projects/assets/chestcavity/lang/zh_cn.json   # 提交给 CFPA 用的同内容文件
├── build.ps1                              # 重新生成 dist/ 下四个包
└── LICENSE
```

修改译文只需要动 `assets/chestcavity/lang/zh_cn.json`，然后跑一次构建：

```powershell
pwsh -File build.ps1
```

脚本会按 1.16 / 1.18 / 1.19 / 1.20.1 四个格式号分别打包到 `dist/`。

## 提交给 CFPA / I18nUpdateMod

CFPA 的 [Minecraft-Mod-Language-Package](https://github.com/CFPAOrg/Minecraft-Mod-Language-Package) 现在是单份共享文件结构，目标路径：

```
projects/assets/chestcavity/lang/zh_cn.json
```

## 更新日志

- **2026-11-20** — 首个版本，371 键，覆盖 1.16.2 ~ 1.20.1。

## 致谢

- 模组作者 [David Troyer (Tigereye504)](https://github.com/Tigereye504/chestcavity)，Chest Cavity 以 CC0 协议发布；
- [CFPA Org](https://github.com/CFPAOrg) 提供的汉化规范与术语参考。

## 许可

[CC0-1.0](LICENSE)：与 Chest Cavity 本体一致，可自由使用、修改、再分发，无需署名。
