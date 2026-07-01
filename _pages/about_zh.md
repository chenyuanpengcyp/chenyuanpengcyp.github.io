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

我是**陈远鹏**，资深算法专家与团队负责人，长期专注于可量产自动驾驶系统的算法架构、工程落地与性能优化。我的工作覆盖端到端自动驾驶、BEV 感知、视觉-语言-行为（VLA）模型、世界模型，以及面向边缘端的大模型高效推理与部署。

我参与并主导过从研究探索、系统设计、模型训练、部署优化到量产验证的完整研发流程。相比单纯追求离线指标，我更关注如何把前沿 AI 方法转化为稳定、高效、可维护的车端系统，让算法真正经受真实道路、算力约束和工程边界的检验。

近期，我主导设计了面向部署的 BEV 感知框架 FastBEV++，该工作已被 IROS 2026 录用；它在低功耗车规级芯片上实现实时性能，并探索了无需自定义算子的 “OneModel” 跨平台部署策略。我也带领团队将 InternVL-6B、LoRA、RLHF 等技术应用于驾驶场景理解与决策推理，获得 PRCV 2024 DriveLM 挑战赛一等奖。

我的长期目标是面向物理世界构建具身智能，并以自动驾驶作为重要试验场。我关注能够理解动态场景、预测交互演化、形成因果认知并做出安全决策的 AI 系统。

### 重点经历

- **面向量产的 BEV 感知架构**：主导并开源 [FastBEV++](https://github.com/ymlab/advanced-fastbev)，该工作被 IROS 2026 录用，在低功耗车规级 SoC 上实现实时推理，并支持无自定义算子的跨平台部署。
- **端到端系统研发**：从零到一推进统一感知系统的方案设计、研发迭代与量产验证。
- **视觉语言驾驶智能**：带领团队获得 PRCV 2024 DriveLM 挑战赛一等奖，将多模态大模型用于驾驶场景理解与决策推理。
- **边缘端 VLM 高效推理**：开源 [EdgeFM](https://github.com/windog-labs/edge-fm-x)，面向视觉语言模型的边缘端大模型高效推理引擎。
- **资源高效的视觉生成**：研发并开源 [EasyVFX](https://github.com/mayuelala/EasyVFX)，通过频域驱动解耦实现资源高效的 VFX 生成，该工作已被 SIGGRAPH 2026 录用。
- **硬件感知优化**：通过量化感知训练、模型压缩和部署友好的网络设计，提升车端推理效率。

## 🌟 研究兴趣

- **自动驾驶**：VLA 模型、端到端自动驾驶系统、BEV 感知、多模态场景理解
- **世界模型与仿真**：动态场景建模、生成式仿真、高效视觉生成、闭环评测、大规模强化学习
- **可部署 AI**：边缘端多模态大模型推理优化、模型压缩、量化部署、面向硬件的算法设计

## 📚 学术成果

1. **FastBEV++: Fast by Algorithm, Deployable by Design** (IROS 2026)
   Y. Chen, H. Song, W. Tao, S. Mo, S. Zhang, X. Hua, T. Zhao. arXiv:2512.08237
   开源项目：[github.com/ymlab/advanced-fastbev](https://github.com/ymlab/advanced-fastbev)
2. **EdgeFM: Efficient Edge Inference for Vision-Language Models**
   开源项目：[github.com/windog-labs/edge-fm-x](https://github.com/windog-labs/edge-fm-x)
3. **EasyVFX: Frequency-Driven Decoupling for Resource-Efficient VFX Generation** (SIGGRAPH 2026)
   开源项目：[github.com/mayuelala/EasyVFX](https://github.com/mayuelala/EasyVFX)
4. **Precise Drive with VLM: First Prize Solution for PRCV 2024 DriveLM Challenge**
   B. Huang, S. Wang, Y. Chen, Y. Wu, H. Song, Z. Ding, et al.
5. **RTN: Reparameterized Ternary Network** (AAAI 2020)
   Y. Li, X. Dong, S. Q. Zhang, H. Bai, Y. Chen, W. Wang
