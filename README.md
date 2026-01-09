<![CDATA[<a name="readme-top"></a>

<!-- PROJECT SHIELDS -->
<div align="center">

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![42 Profile][42-shield]][42-url]

</div>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/timurlog/42-script-toolbox">
    <img src="assets/sh_logo.png" alt="Logo" width="140" height="140">
  </a>

  <h1>42 Script Toolbox</h1>

  <p align="center">
    <strong>🚀 Automate your 42 workflow. Focus on coding, not setup.</strong>
    <br />
    <br />
    <a href="#-quick-start">Quick Start</a>
    ·
    <a href="#-commands">Commands</a>
    ·
    <a href="https://github.com/timurlog/42-script-toolbox/issues/new?labels=bug">Report Bug</a>
    ·
    <a href="https://github.com/timurlog/42-script-toolbox/issues/new?labels=enhancement">Request Feature</a>
  </p>
</div>

<br />

<!-- DEMO GIF -->
<div align="center">
  <img src="assets/demo.gif" alt="Demo" width="600">
</div>

<br />

---

## ✨ Features

<table>
<tr>
<td width="50%">

### 🎯 Project Scaffolding
- Initialize git repositories
- Generate C/C++ Makefiles with 42 headers
- Create folder structures (`src/`, `include/`)
- Add comprehensive `.gitignore`

</td>
<td width="50%">

### 📚 Libft Integration
- Clone your libft with one command
- Sync changes back to your repo
- Automatic header management
- Works with any git hosting

</td>
</tr>
<tr>
<td width="50%">

### ⚡ Time Saver
- No more copy-pasting boilerplate
- Consistent project structure
- Beautiful colorized output
- Interactive prompts with defaults

</td>
<td width="50%">

### 🔧 Easy Maintenance
- Self-updating toolbox
- Version checking
- Alias verification
- Works on Linux & macOS

</td>
</tr>
</table>

---

## 🚀 Quick Start

### Installation

Run this single command:

```bash
bash -c "$(curl -fsSL https://raw.github.com/timurlog/42-script-toolbox/main/bin/install.sh)"
```

<details>
<summary>📋 What you'll be asked</summary>

| Prompt | Description | Example |
|--------|-------------|---------|
| **Username** | Your 42 intra login | `tilogie` |
| **Email** | Your 42 email | `tilogie@student.42.fr` |
| **Libft URL** | Your libft repository | `git@github.com:user/libft.git` |

</details>

<details>
<summary>📁 Required libft structure</summary>

Your libft repository should follow this structure:

```
your-libft-repo/
├── include/
│   └── libft.h
└── libft/
    ├── Makefile
    ├── ft_strlen.c
    ├── ft_memset.c
    └── ...
```

> 💡 See [my libft](https://github.com/timurlog/Libft) as a reference

</details>

### Update

```bash
supdate
```

Or manually:

```bash
bash -c "$(curl -fsSL https://raw.github.com/timurlog/42-script-toolbox/main/bin/update.sh)"
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## 📖 Commands

<table>
<thead>
<tr>
<th width="120">Command</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>snew</code></td>
<td>
<strong>Create a new project</strong><br>
<sub>Initialize repo, generate Makefile, setup folders, add libft</sub>
</td>
</tr>
<tr>
<td><code>slib</code></td>
<td>
<strong>Add libft to project</strong><br>
<sub>Clone your libft into the current directory</sub>
</td>
</tr>
<tr>
<td><code>smake</code></td>
<td>
<strong>Generate Makefile</strong><br>
<sub>Create C/C++ Makefile with 42 header and colors</sub>
</td>
</tr>
<tr>
<td><code>signore</code></td>
<td>
<strong>Create .gitignore</strong><br>
<sub>Comprehensive ignore patterns for 42 projects</sub>
</td>
</tr>
<tr>
<td><code>spush</code></td>
<td>
<strong>Push libft changes</strong><br>
<sub>Sync local libft modifications back to your repo</sub>
</td>
</tr>
<tr>
<td><code>supdate</code></td>
<td>
<strong>Update toolbox</strong><br>
<sub>Pull latest version and verify installation</sub>
</td>
</tr>
<tr>
<td><code>shelp</code></td>
<td>
<strong>Show help</strong><br>
<sub>Display all commands and configuration</sub>
</td>
</tr>
<tr>
<td><code>sversion</code></td>
<td>
<strong>Show version</strong><br>
<sub>Display version, system info, check for updates</sub>
</td>
</tr>
</tbody>
</table>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## 🎬 Usage Examples

### Create a new project

```bash
$ snew

    ╔═╗┌─┐┬ ┬  ╔═╗┬─┐┌─┐ ┬┌─┐┌─┐┌┬┐
    ║╣ ├┤ │││  ╠═╝├┬┘│ │ │├┤ │   │ 
    ╝  └─┘└┴┘  ╩  ┴└─└─┘└┘└─┘└─┘ ┴ 

  ⚙ Project Information
  📁 Project name: push_swap
  
  ⚙ Repository Setup
  ? Clone from existing repository? [y/N] n
  ✓ Repository initialized

  ⚙ Project Structure
  ✓ Created .gitignore
  ✓ Compiler configured
  ✓ Created src/ directory
  ✓ Created include/ directory

  🚀 Project Created Successfully!
```

### Check version and updates

```bash
$ sversion

  Version      1.0.0
  Build Date   2025-01-09

  ━━━ INSTALLATION ━━━━━━━━━━━━━━━━━━━━━━━━━
  Install Path   ✓ ~/.script
  Git Status     ✓ main@a1b2c3d
  Scripts        ✓ 11 scripts installed

  ━━━ ALIASES ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  snew         ✓ configured
  slib         ✓ configured
  smake        ✓ configured
  ...

  ━━━ UPDATE CHECK ━━━━━━━━━━━━━━━━━━━━━━━━━
  ✓ You're up to date!
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## 🛠️ Built With

<div align="center">

[![Shell][shell-badge]][shell-url]
[![Bash][bash-badge]][bash-url]
[![Git][git-badge]][git-url]

</div>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## 🤝 Contributing

Contributions make the open source community amazing! Any contributions are **greatly appreciated**.

<details>
<summary>How to contribute</summary>

1. **Fork** the Project
2. **Create** your Feature Branch
   ```bash
   git checkout -b feature/AmazingFeature
   ```
3. **Commit** your Changes
   ```bash
   git commit -m '✨ Add some AmazingFeature'
   ```
4. **Push** to the Branch
   ```bash
   git push origin feature/AmazingFeature
   ```
5. **Open** a Pull Request

</details>

### Top Contributors

<a href="https://github.com/timurlog/42-script-toolbox/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=timurlog/42-script-toolbox" alt="Contributors" />
</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## 📄 License

Distributed under the **MIT License**. See [`LICENSE`](LICENSE.txt) for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## 📬 Contact

<div align="center">

**Timur Logie**

[![42 Profile][42-shield]][42-url]
[![Email][email-badge]][email-url]
[![GitHub][github-badge]][github-url]

</div>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

## 🙏 Acknowledgments

- [Francinette](https://github.com/xicodomingues/francinette) - Inspiration for install script
- [Best-README-Template](https://github.com/othneildrew/Best-README-Template) - README template
- [Choose a License](https://choosealicense.com/) - License selection

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<div align="center">

**Made with ❤️ for 42 students**

⭐ Star this repo if you find it useful!

</div>

<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/timurlog/42-script-toolbox.svg?style=for-the-badge
[contributors-url]: https://github.com/timurlog/42-script-toolbox/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/timurlog/42-script-toolbox.svg?style=for-the-badge
[forks-url]: https://github.com/timurlog/42-script-toolbox/network/members
[stars-shield]: https://img.shields.io/github/stars/timurlog/42-script-toolbox.svg?style=for-the-badge
[stars-url]: https://github.com/timurlog/42-script-toolbox/stargazers
[issues-shield]: https://img.shields.io/github/issues/timurlog/42-script-toolbox.svg?style=for-the-badge
[issues-url]: https://github.com/timurlog/42-script-toolbox/issues
[license-shield]: https://img.shields.io/badge/License-MIT-green?style=for-the-badge
[license-url]: https://github.com/timurlog/42-script-toolbox/blob/main/LICENSE.txt
[42-shield]: https://img.shields.io/badge/42-Profile-000000?style=for-the-badge&logo=42&logoColor=white
[42-url]: https://profile.intra.42.fr/users/tilogie
[product-screenshot]: assets/image.png

<!-- Tech badges -->
[shell-badge]: https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white
[shell-url]: https://www.gnu.org/software/bash/
[bash-badge]: https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white
[bash-url]: https://www.gnu.org/software/bash/
[git-badge]: https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white
[git-url]: https://git-scm.com/

<!-- Contact badges -->
[email-badge]: https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white
[email-url]: mailto:tilogie@student.42belgium.be
[github-badge]: https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white
[github-url]: https://github.com/timurlog
]]>