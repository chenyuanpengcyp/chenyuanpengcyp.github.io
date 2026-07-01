---
layout: about
title: Yuanpeng Chen 
permalink: /
lang: en
keywords:
  - Yuanpeng Chen
  - Vision-Language-Action
  - Autonomous Driving

profile:
  align: right
  image: portrait.jpeg
  image_circular: true # crops the image to make it circular
  more_info: >
    <p>Email: chenyuanpengcyp@gmail.com</p>
    <p>WeChat: chenyuanpeng24</p>
    <p>Shanghai, China</p>

selected_papers: false # includes a list of papers marked as "selected={true}"
social: true # includes social icons at the bottom of the page

announcements:
  enabled: false # includes a list of news items
  scrollable: true # adds a vertical scroll bar if there are more than 3 news items
  limit: 5 # leave blank to include all the news in the `_news` folder

latest_posts:
  enabled: false
  scrollable: true # adds a vertical scroll bar if there are more than 3 new posts items
  limit: 3 # leave blank to include all the blog posts
---

## 🔭 About Me

I am **Yuanpeng Chen**, a senior algorithm expert and team lead working on production autonomous driving and deployable multi-modal AI. My work connects vehicle-scale perception and decision systems with end-to-end driving, BEV perception, Vision-Language-Action (VLA) models, world models, and efficient edge inference.

I have led algorithm development across the full lifecycle, from research exploration and system architecture to model training, inference optimization, engineering validation, and mass-production deployment. I care about systems where model design, data strategy, training pipeline, inference engine, and hardware constraints are considered together, because that is where research becomes usable in real vehicles and edge devices.

My recent work follows a consistent direction: making advanced AI models both capable and deployable. FastBEV++ explores production-oriented BEV perception; EdgeFM focuses on efficient edge inference for vision-language models; EasyVFX studies resource-efficient visual generation; and our DriveLM work applies VLMs to driving-scene understanding and decision reasoning.

### Research Vision

I view autonomous driving as one of the most demanding testbeds for embodied intelligence. The next generation of intelligent systems should unify perception, language, prediction, generation, and action, while remaining efficient enough to run on real edge and vehicle platforms. My goal is to build AI systems that understand dynamic scenes, reason about future interactions, and make safe decisions with both predictive and causal awareness.

### Key Highlights

- **Production-oriented BEV perception**: Architected and open-sourced [FastBEV++](https://github.com/ymlab/advanced-fastbev), a deployable BEV perception framework accepted to IROS 2026 that reaches real-time performance on low-power automotive SoCs and supports a "OneModel" cross-platform deployment strategy without custom operators.
- **System-level engineering**: Led unified perception systems from early-stage research to production validation, covering model design, optimization, and deployment.
- **Vision-language driving intelligence**: Led the team that won First Prize in the PRCV 2024 DriveLM Challenge, applying InternVL-6B, LoRA, and RLHF techniques to driving-scene understanding and decision reasoning.
- **Efficient edge inference for VLMs**: Open-sourced [EdgeFM](https://github.com/windog-labs/edge-fm-x), an efficient edge inference engine for vision-language models.
- **Resource-efficient visual generation**: Developed and open-sourced [EasyVFX](https://github.com/mayuelala/EasyVFX), a frequency-driven decoupling method for resource-efficient VFX generation, accepted to SIGGRAPH 2026.
- **Hardware-aware optimization**: Improved inference efficiency on automotive platforms through quantization-aware training, model compression, and deployment-oriented network design.


## 🌟 Research Interests

- **Autonomous Driving**: VLA models, end-to-end driving systems, BEV perception, and multi-modal scene understanding
- **World Models & Simulation**: Dynamic scene modeling, generative simulation, efficient visual generation, closed-loop evaluation, and scalable reinforcement learning
- **Deployable AI**: Edge inference for large multi-modal models, model compression, quantization, and hardware-aware algorithm design


## 📚 Academic Achievements

1. **FastBEV++: Fast by Algorithm, Deployable by Design** (IROS 2026)
   Y. Chen, H. Song, W. Tao, S. Mo, S. Zhang, X. Hua, T. Zhao. arXiv:2512.08237
   Open-source project: [github.com/ymlab/advanced-fastbev](https://github.com/ymlab/advanced-fastbev)
2. **EdgeFM: Efficient Edge Inference for Vision-Language Models**
   Open-source project: [github.com/windog-labs/edge-fm-x](https://github.com/windog-labs/edge-fm-x)
3. **EasyVFX: Frequency-Driven Decoupling for Resource-Efficient VFX Generation** (SIGGRAPH 2026)
   Open-source project: [github.com/mayuelala/EasyVFX](https://github.com/mayuelala/EasyVFX)
4. **Precise Drive with VLM: First Prize Solution for PRCV 2024 DriveLM Challenge**
   B. Huang, S. Wang, Y. Chen, Y. Wu, H. Song, Z. Ding, et al.
5. **RTN: Reparameterized Ternary Network** (AAAI 2020)
   Y. Li, X. Dong, S. Q. Zhang, H. Bai, Y. Chen, W. Wang
