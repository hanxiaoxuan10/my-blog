---
title: Twikoo 评论系统部署指南
date: 2026-05-18
tags:
  - 博客
  - 评论
  - Twikoo
  - 教程
categories:
  - 随笔
cover: /images/post/markerdown.jpg
coverWidth: 1200
coverHeight: 630
comments: true
---

## 关于 Twikoo

Twikoo 是一个简洁、安全、免费的静态网站评论系统，部署在 Vercel 上，无需维护服务器。

---

## 一键部署

点击下方按钮，一键部署 Twikoo 后端到 Vercel：

<a href="https://vercel.com/new/clone?repository-url=https://github.com/twikoojs/twikoo/tree/main" target="_blank" style="display:inline-block;padding:12px 24px;background:#000;color:#fff;border-radius:6px;text-decoration:none;font-size:16px;">
  ▷ 一键部署到 Vercel
</a>

> 需要先注册 [Vercel 账号](https://vercel.com)（可用 GitHub 账号登录）。

## 配置步骤

### 步骤 1：部署后端

1. 点击上方按钮
2. 用 GitHub 账号登录 Vercel
3. 选择 `twikoo/twikoo` 仓库，点击 **Deploy**
4. 等待部署完成（约 1-2 分钟）

### 步骤 2：设置环境变量

部署完成后，在 Vercel 项目设置中添加环境变量：

```
SITE_NAME = 你的博客名称
```

### 步骤 3：获取部署地址

部署成功后，Vercel 会分配一个域名，例如：

```
https://twikoo-xxxx.vercel.app
```

### 步骤 4：更新博客配置

将 `_config.tangyuxian.yml` 中的 `slotComment` 里的 `envId` 替换为你的 Vercel 域名。

### 步骤 5：重新生成博客

```bash
cd g:\blog
npx hexo clean && npx hexo generate
```

刷新页面即可看到评论区。

---

## 管理员登录

访问 `https://你的域名.vercel.app/admin` 进入管理后台：

1. 首次登录设置管理员密码
2. 可管理评论（审核、删除、回复）
3. 支持邮件通知配置

---

## 自定义样式

在 `source/custom.css` 中添加评论框样式：

```css
/* Twikoo 评论框样式 */
.tk-comments {
  max-width: 100%;
}
.tk-submit {
  background: var(--color-card);
  border-radius: 8px;
  padding: 16px;
}
```
