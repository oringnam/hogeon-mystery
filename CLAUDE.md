# CLAUDE.md — hogeon-mystery (호건이를 찾아서)

이 문서는 이 레포에서 Claude/OpenClaw가 작업할 때의 **운영 지침 + 레슨런 + 변경 포인트**를 정리한다.

## 프로젝트 개요
- Ink(inklecate)로 `.ink` → `.json`(inkjs) 컴파일
- GitHub Pages 배포 (모바일 플레이)
- 레포: `https://github.com/oringnam/hogeon-mystery`
- 라이브: `https://oringnam.github.io/hogeon-mystery/`

## 주요 파일
- Story entry: `games/hogeon/story.ink` (INCLUDE 모음)
- Compiled: `games/hogeon/story.json`
- Game UI: `games/hogeon/index.html`
- Service Worker: `sw.js`

## 필수 명령어
### 컴파일
```bash
./scripts/compile.sh hogeon
```

### 배포
```bash
git push origin main
# GitHub Pages 자동 반영
```

## Hotfix 운영 규칙 (캐시/배포)
모바일에서 "고쳤는데 그대로" 이슈가 매우 빈번했음. 아래 3개를 **항상 같이** 관리.

1) UI 버전 문자열
- `games/hogeon/index.html` 의 `.version-info`

2) Service Worker 캐시 버전
- `sw.js` 의 `CACHE_NAME` 를 매 hotfix마다 bump

3) story.json 캐시 버스트
- `games/hogeon/index.html`에서 story 로딩 시 쿼리 파라미터 포함:
  - 예: `fetch('story.json?v=3.15')`

검증 팁:
- 사용자에게 시크릿 탭으로 열어보라고 요청하면 캐시 이슈 분리가 빠름.

## Ink/inkjs 관련 레슨런
### 1) Markdown 미지원
- inkjs는 기본적으로 Markdown 렌더링을 하지 않음.
- `**bold**` 같은 문구는 그대로 노출됨 → 텍스트는 **plain** 으로 작성.

### 2) 분기/선택지 실종
- hub에서 조건식이 누적되면 모든 선택지가 false가 되어 진행 불가가 발생.
- 원칙: **항상 최소 1개의 선택지**가 남도록 설계하거나 fallback choice 제공.

## 엔딩 UX 레슨런
### 자동 팝업 금지
- 엔딩 모달이 자동으로 뜨면, 플레이어가 엔딩 스토리를 읽지 못함.
- 해결: 스토리 종료 시 선택지로 `🏁 엔딩 보기` 버튼을 노출하고, 눌렀을 때만 모달 표시.

관련 코드:
- `games/hogeon/index.html`의 `continueStory()` EOF 처리

## 공유(카톡) 레슨런
### 사용자 목표
- 한국 사용자 핵심 워크플로우: **"공유 텍스트 복사 → 카카오톡에 붙여넣기"**

### 구현 원칙
- 1차: `navigator.clipboard.writeText()` 자동 복사 시도
- 2차: `document.execCommand('copy')` fallback
- 3차: 수동 복사용 모달(텍스트 영역) 표시

주의:
- 모바일 환경에서 clipboard API는 gesture/권한에 따라 실패 가능.
- 실패 시에는 반드시 사용자에게 **수동 복사 경로**를 제공.

## 이번 세션에서 겪은 실제 이슈 요약 (성공/실패)
- 성공
  - `**` 마크다운 잔존 제거
  - hub 조건 완화로 선택지 실종 완화
  - SW 캐시 bump + story.json cache-bust로 "구버전 노출" 문제 해결
  - 엔딩 모달 자동 팝업 → 버튼 선택 방식으로 UX 개선
- 실패/교훈
  - clipboard 문제를 모달/웹공유로 우회하려다 사용자 목적(카톡 붙여넣기)과 엇갈림
  - 함수 누락(`getCollectedEndings`)로 런타임 에러 발생 → 공유/엔딩 UI는 함수 의존성 체크 필수
  - 버전 문자열에 미래 시각을 넣는 실수 → 시간 표기는 `session_status`로 확인 후 반영
