---
layout: page
permalink: /publications/
title: Publications
description: A comprehensive list of my research publications in autonomous driving, computer vision, and AI.
nav: true
nav_order: 2
---

<div class="row">
  <div class="col-md-3">
    <div class="card">
      <div class="card-body text-center">
        <h3>465+</h3>
        <p class="text-muted">Total Citations</p>
      </div>
    </div>
  </div>
  <div class="col-md-3">
    <div class="card">
      <div class="card-body text-center">
        <h3>27</h3>
        <p class="text-muted">Publications</p>
      </div>
    </div>
  </div>
  <div class="col-md-3">
    <div class="card">
      <div class="card-body text-center">
        <h3>9</h3>
        <p class="text-muted">h-index</p>
      </div>
    </div>
  </div>
  <div class="col-md-3">
    <div class="card">
      <div class="card-body text-center">
        <h3>8</h3>
        <p class="text-muted">i10-index</p>
      </div>
    </div>
  </div>
</div>

<div class="alert alert-info mt-4" role="alert">
  <i class="fas fa-info-circle"></i> Publications are listed in reverse chronological order. Click on the title for more details.
</div>

<!-- _pages/publications.md -->
<div class="publications">

{% bibliography -f {{ site.scholar.bibliography }} %}

</div>

<style>
.card {
  margin-bottom: 1rem;
  transition: all 0.3s ease;
}

.card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 16px rgba(0,0,0,0.1);
}

.card h3 {
  color: var(--global-theme-color);
  font-weight: bold;
  margin-bottom: 0;
}
</style>
