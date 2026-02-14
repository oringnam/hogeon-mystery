# 호건이를 찾아서 (Where is Hogeon?)

9년 만의 미스터리를 풀어가는 인터랙티브 스토리 게임.

## 🎮 게임 소개

2017년부터 연락이 끊긴 친구 호건이.  
9명의 고등학교 동창들이 그를 찾아 나섭니다.  
**당신의 선택이 진실을 결정합니다.**

### 특징

- ✨ **9가지 다른 엔딩** - 단서 수집에 따라 결말이 달라집니다
- 🔍 **추리 기반 게임플레이** - SNS, 가족, 대학, 공공기록 등 다각도 조사
- ⏱️ **30분 플레이** - 부담 없이 즐기는 미스터리
- 📱 **모바일 최적화** - 언제 어디서나 플레이
- 👥 **실화 기반 캐릭터** - 실제 친구들의 설정

### 가능한 엔딩

1. 🎰 로또 당첨의 고독
2. 🚢 바다의 남자 (원양어선)
3. 🏥 잠든 친구 (코마)
4. 🛡️ 증인의 귀환
5. ✨ 이세계 전이 전설
6. 👁️ 그림자 요원 (국정원)
7. 🙏 깨달음의 길 (종교)
8. 💼 재기의 섬 (사업)
9. ⚖️ 속죄와 용서 (출소)

## 🛠️ 기술 스택

- **Ink** - 인터랙티브 내러티브 스크립팅 언어
- **inkjs** - 웹 런타임 (v2.3.0)
- **inklecate** - 컴파일러 (v1.2.0)

## 📦 설치 및 실행

### 1. inklecate 설치

```bash
cd hogeon-mystery
./scripts/setup-inklecate.sh
```

### 2. 스토리 컴파일

```bash
./scripts/compile.sh hogeon
```

### 3. 로컬 실행

```bash
# Python 간이 서버
python3 -m http.server 8000

# 또는 Node.js
npx http-server -p 8000
```

브라우저에서 `http://localhost:8000` 접속

## 📁 프로젝트 구조

```
hogeon-mystery/
├── index.html              # 메인 페이지 (게임 소개)
├── games/
│   └── hogeon/
│       ├── story.ink       # 스토리 원본 (수정 가능)
│       ├── story.json      # 컴파일된 파일 (자동 생성)
│       └── index.html      # 게임 플레이 페이지
├── scripts/
│   ├── setup-inklecate.sh  # inklecate 설치
│   └── compile.sh          # 컴파일 스크립트
├── tools/
│   └── inklecate           # 컴파일러 바이너리
└── README.md
```

## ✏️ 스토리 수정

`games/hogeon/story.ink` 파일을 수정한 후:

```bash
./scripts/compile.sh hogeon
```

Ink 문법: [Ink Documentation](https://github.com/inkle/ink/blob/master/Documentation/WritingWithInk.md)

## 🌐 배포 (GitHub Pages)

### 1. GitHub 레포 생성

```bash
git init
git remote add origin https://github.com/<username>/hogeon-mystery.git
git branch -M main
```

### 2. Push

```bash
git add -A
git commit -m "Initial commit"
git push -u origin main
```

### 3. GitHub Pages 활성화

- Settings → Pages → Source: main branch
- URL: `https://<username>.github.io/hogeon-mystery/`

## 🎭 캐릭터

- **진원** - 개발자, 당근, 결혼, 아들 있음
- **범환** - 개발자, 라포랩스
- **정호** - 에너지솔루션, 대전 거주
- **효배** - 교사, 목동, 결혼
- **현식** - 공예가
- **형준** - 건축 프리랜서
- **의진** - 일식 요리사, 일산
- **현** - 데이터 분석, 롯데마트
- **재원** - 유튜브 PD 출신 프리랜서
- **호건** - 실종된 친구 (2017년~)

## 📜 라이선스

이 프로젝트는 개인 프로젝트입니다.  
Ink는 MIT 라이선스를 따릅니다.

## 🙏 크레딧

- **Story & Design**: jwpark0830
- **Tech**: Ink (Inkle Studios), inkjs (Yannick Lohse)
- **Inspired by**: 실제 친구들

---

**즐거운 플레이 되세요! 🎮**
