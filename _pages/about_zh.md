---
layout: about
title: 主页
permalink: /zh/
lang: zh
subtitle:  自动驾驶专家 | AI 研究员

profile:
  align: right
  image: portrait.jpeg
  image_circular: true # crops the image to make it circular
  more_info: >
    <p>Email: chenyuanpengcyp@gmail.com</p>
    <p>微信: chenyuanpeng24</p>
    <p>上海，中国</p>

selected_papers: false # includes a list of papers marked as "selected={true}"
social: false # includes social icons at the bottom of the page

announcements:
  enabled: false # includes a list of news items
  scrollable: true # adds a vertical scroll bar if there are more than 3 news items
  limit: 5 # leave blank to include all the news in the `_news` folder

latest_posts:
  enabled: false
  scrollable: true # adds a vertical scroll bar if there are more than 3 new posts items
  limit: 3 # leave blank to include all the blog posts
---


## 🔭 关于我

我是**陈远鹏**，资深算法专家与团队负责人，长期专注于可量产自动驾驶系统与可部署多模态 AI。我的工作连接车端感知与决策系统、端到端自动驾驶、BEV 感知、视觉-语言-行为（VLA）模型、世界模型，以及面向边缘端的大模型高效推理。

我参与并主导过从研究探索、系统设计、模型训练、推理优化、工程验证到量产部署的完整研发流程。相比单纯追求离线指标，我更关注模型结构、数据策略、训练流程、推理引擎和硬件约束之间的协同，因为这决定了前沿 AI 方法能否真正进入车辆和边缘设备。

我近期的工作有一条清晰主线：让先进 AI 模型既具备能力，也能够高效部署。FastBEV++ 面向可量产 BEV 感知，EdgeFM 面向视觉语言模型的边缘端高效推理，EasyVFX 探索资源高效的视觉生成，DriveLM 相关工作则将 VLM 应用于驾驶场景理解与决策推理。

### 研究愿景

我认为自动驾驶是具身智能最具挑战性的真实试验场之一。下一代智能系统需要统一感知、语言、预测、生成与行动，同时还要能够在真实车端和边缘端算力约束下稳定运行。我的目标是构建能够理解动态场景、预测交互演化、形成因果认知并做出安全决策的 AI 系统。

### 重点经历

- **面向量产的 BEV 感知架构**：主导并开源 [FastBEV++](https://github.com/ymlab/advanced-fastbev)，该工作被 IROS 2026 录用，在低功耗车规级 SoC 上实现实时推理，并支持无自定义算子的跨平台部署。
- **系统级工程落地**：从零到一推进统一感知系统的方案设计、模型优化、部署适配与量产验证。
- **视觉语言驾驶智能**：带领团队获得 PRCV 2024 DriveLM 挑战赛一等奖，将多模态大模型用于驾驶场景理解与决策推理。
- **边缘端 VLM 高效推理**：开源 [EdgeFM](https://github.com/windog-labs/edge-fm-x)，面向视觉语言模型的边缘端大模型高效推理引擎。
- **资源高效的视觉生成**：研发并开源 [EasyVFX](https://github.com/mayuelala/EasyVFX)，通过频域驱动解耦实现资源高效的 VFX 生成，该工作已被 SIGGRAPH 2026 录用。
- **硬件感知优化**：通过量化感知训练、模型压缩和部署友好的网络设计，提升车端推理效率。

## 🌟 研究兴趣

- **自动驾驶**：VLA 模型、端到端自动驾驶系统、BEV 感知、多模态场景理解
- **世界模型与仿真**：动态场景建模、生成式仿真、高效视觉生成、闭环评测、大规模强化学习
- **可部署 AI**：边缘端多模态大模型推理优化、模型压缩、量化部署、面向硬件的算法设计

## 📚 学术成果

1. **[Rethinking Text-Based Image Retrieval in Specific Domain](https://arxiv.org/abs/2608.10524)** (arXiv 2026)
   J. Tan, S. Yang, Y. Chen, J. Wang, N. Ye, C. Xing, L. Jia. arXiv:2608.10524
2. **FastBEV++: Fast by Algorithm, Deployable by Design** (IROS 2026)
   Y. Chen, H. Song, W. Tao, S. Mo, S. Zhang, X. Hua, T. Zhao. arXiv:2512.08237
   开源项目：[github.com/ymlab/advanced-fastbev](https://github.com/ymlab/advanced-fastbev)
3. **EdgeFM: Efficient Edge Inference for Vision-Language Models**
   开源项目：[github.com/windog-labs/edge-fm-x](https://github.com/windog-labs/edge-fm-x)
4. **EasyVFX: Frequency-Driven Decoupling for Resource-Efficient VFX Generation** (SIGGRAPH 2026)
   开源项目：[github.com/mayuelala/EasyVFX](https://github.com/mayuelala/EasyVFX)
5. **Precise Drive with VLM: First Prize Solution for PRCV 2024 DriveLM Challenge**
   B. Huang, S. Wang, Y. Chen, Y. Wu, H. Song, Z. Ding, et al.
6. **RTN: Reparameterized Ternary Network** (AAAI 2020)
   Y. Li, X. Dong, S. Q. Zhang, H. Bai, Y. Chen, W. Wang
