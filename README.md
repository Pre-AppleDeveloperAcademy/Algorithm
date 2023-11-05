# 👊🏻 포항항 알고리즘 스터디

#### 포항항 8인방의 천방지축 알고리즘 성장일기

<br/>

## ⏰ Time & Period

- 기간 : 11월 둘째 주 ~
- Meeting : 매주 목요일 10:00pm

<br/>

## 🧑🏻‍💻 Participants

|나기/윤학|구밥/지원|리버/경수|라프/예강|허니비/현희|쿠키/민준|롭/수진|윤/윤기|
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
|<a href="https://github.com/Naknakk">@Naknakk</a>|<a href="https://github.com/baabguui">@baabguui</a>|<a href="https://github.com/kyxxgsoo">@kyxxgsoo</a>|<a href="https://github.com/ye-gang-jjang">@ye-gang-jjang</a>|<a href="https://github.com/hyeonheebee">@hyeoneeB</a>|<a href="https://github.com/thinkySide">@thinkySide</a>|<a href="https://github.com/Jinjinjinzin">@Jinjinjinzin</a>|<a href="https://github.com/YunKi-H">@YunKi-H</a>|

<br/>

## 📖 Process
- 매 주 한 문제씩 선정하여 문제를 공유하고, 각자 팀원들은 미팅날까지 문제를 풀어옵니다.
- 미팅날 사다리타기로 문제를 선정하여 발표합니다.

<br/>

## Pull Request & Commit Rule


### 📌 PR Rule

- 이 Repository를 각자 Fork합니다.
- 각자의 닉네임으로 Fork한 Repository에서 branching합니다. (Ex. 'Liver' 브랜치 생성)
- 푼 문제(+풀이과정, 설명)을 commit 후 PR 요청을 합니다.
- 미팅 시간에, 리더가 PR을 확인하고 Merge합니다.
- PR Message
  `[N주차] 닉네임` (Ex. `[1주차] Liver`)

### Commit Rule

- 자신의 팀 폴더 - 주차 - (자신의 닉네임) 폴더에 알맞게 commit합니다.

  > 예시
  >
  > ```bash
  > Liver
  > ├── [백준 - 1000] A+B
  > │   ├── [백준 - 1000] A+B.py
  > │   └── [백준 - 1000] 풀이.md
  > ```

- Commit Message
  1. 문제별로 하나씩 commit할 때는 `[N주차] [문제 사이트 - 문제 번호] 문제명`
     - Ex. `[1주차] [백준 - 1000] A+B`
  2. 주차별로 한번에 commit할 때는 `[N주차] 닉네임`
     - Ex. `[1주차] Liver`

<br />

## File Structure (Example)

```bash
.
├── Week 1
│   ├── Nagi
│   │   ├── [백준 - 1000] A+B
│   │   │   ├── [백준 - 1000] A+B.py
│   │   │   └── [백준 - 1000] 풀이.md
│   │   └── [백준 - 1005] ACM Craft
│   │       ├── [백준 - 1005] ACM Craft.py
│   │       └── [백준 - 1005] 풀이.md
│   ├── Gubaab
│   │   ├── [백준 - 1000] A+B
│   │   └── ├── [백준 - 1000] A+B.py
│   │   │   └── [백준 - 1000] 풀이.md
│   │   └── [백준 - 1005] ACM Craft
│   │       ├── [백준 - 1005] ACM Craft.py
│   │       └── [백준 - 1005] 풀이.md
│   ├── Liver
│   │   ├── [백준 - 1000] A+B
│   │   └── ├── [백준 - 1000] A+B.py
│   │   │   └── [백준 - 1000] 풀이.md
│   │   └── [백준 - 1005] ACM Craft
│   │       ├── [백준 - 1005] ACM Craft.py
│   │       └── [백준 - 1005] 풀이.md
│   ├── Raf
│   │   ├── [백준 - 1000] A+B
│   │   └── ├── [백준 - 1000] A+B.py
│   │   │   └── [백준 - 1000] 풀이.md
│   │   └── [백준 - 1005] ACM Craft
│   │       ├── [백준 - 1005] ACM Craft.py
│   │       └── [백준 - 1005] 풀이.md
│   ├── ...
│   └── ...
├── Week 2
│   ├── Nagi
│   ├── Gubaab
│   ├── Liver
│   ├── Raf
│   ├── ...
│   └── ...
├── ...
└── ...

```

<br/>


## 📚 History

### 🛳️ Season 1

- 기간 : 8월 다섯째 주 ~ 11월 둘째 주

|나기/윤학|구밥/지원|리버/경수|라프/예강|
|:----:|:----:|:----:|:----:|
|<a href="https://github.com/Naknakk">@Naknakk</a>|<a href="https://github.com/baabguui">@baabguui</a>|<a href="https://github.com/kyxxgsoo">@kyxxgsoo</a>|<a href="https://github.com/ye-gang-jjang">@ye-gang-jjang</a>|

| 주차 | 테마                                                       | 문제 번호 및 이름                                                |
| :--- | :------------------------------------------------------- | :----------------------------------------------------------- |
| 1    | 킥오프                                                     | [백준] [1213. 팰린드롬 만들기 (Silver III)](https://www.acmicpc.net/problem/1213)<br/> [백준] [2839 설탕 배달 (Silver IV)](https://www.acmicpc.net/problem/2839)<br/> [백준] [1158. 요세푸스 문제 (Silver IV)](https://www.acmicpc.net/problem/1158)<br/> [백준] [10808. 알파벳 개수 (Bronze IV)](https://www.acmicpc.net/problem/10808) |
| 2    | BFS                                                      | [백준] [2606. 바이러스 (Silver III)](https://www.acmicpc.net/problem/2606)<br/> [백준] [2178. 미로 탐색 (Silver I)](https://www.acmicpc.net/problem/2178)<br/> [백준] [14502. 연구소 (Gold IV)](https://www.acmicpc.net/problem/14502)<br/> [백준] [4179. 불! (Gold IV)](https://www.acmicpc.net/problem/4179) |
| 3    | 자료구조                                                   | [백준] [10799. 쇠막대기 (Silver II)](https://www.acmicpc.net/problem/10799)<br/> [백준] [13335. 트럭 (Silver I)](https://www.acmicpc.net/problem/13335)<br/> [백준] [1406. 에디터(Silver II)](https://www.acmicpc.net/problem/1406)<br/> [백준] [2667. 단지번호붙이기 (Silver I)](https://www.acmicpc.net/problem/2667) |
| 4    | BFS                                                      | [백준] [16174. 점프왕 쩰리(Large) (Silver I)](https://www.acmicpc.net/problem/16174)<br/> [백준] [1012. 유기농 배추 (Silver II)](https://www.acmicpc.net/problem/1012)<br/> [백준] [4179. 불! (Gold IV)](https://www.acmicpc.net/problem/4179)<br/> [백준] [2468. 안전 영역 (Silver I)](https://www.acmicpc.net/problem/2468) |
| 5    | 구현                                                      | [백준] [2573. 빙산 (Gold IV)](https://www.acmicpc.net/problem/2573)<br/> [백준] [18111. 마인크래프트 (Silver II)](https://www.acmicpc.net/problem/18111)<br/> [백준] [2161. 카드1 (Silver V)](https://www.acmicpc.net/problem/2161)<br/> [백준] [20006. 랭킹전 대기열 (Silver II)](https://www.acmicpc.net/problem/20006) |
| 6    | DP                                                       | [백준] [1463. 1로 만들기](https://www.acmicpc.net/problem/1463)<br/> [백준] [2839. 설탕 배달](https://www.acmicpc.net/problem/2839)<br/> [백준] [1932. 정수 삼각형](https://www.acmicpc.net/problem/1932)<br/> [백준] [1149. RGB 거리](https://www.acmicpc.net/problem/1149) |

<br/>

### 🌊 Season 2 (포항항 8인방)

|나기/윤학|구밥/지원|리버/경수|라프/예강|허니비/현희|쿠키/민준|롭/수진|윤/윤기|
|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:|
|<a href="https://github.com/Naknakk">@Naknakk</a>|<a href="https://github.com/baabguui">@baabguui</a>|<a href="https://github.com/kyxxgsoo">@kyxxgsoo</a>|<a href="https://github.com/ye-gang-jjang">@ye-gang-jjang</a>|<a href="https://github.com/hyeonheebee">@hyeoneeB</a>|<a href="https://github.com/thinkySide">@thinkySide</a>|<a href="https://github.com/Jinjinjinzin">@Jinjinjinzin</a>|<a href="https://github.com/YunKi-H">@YunKi-H</a>|

| 주차 | 테마                                                       | 문제 번호 및 이름                                                |
| :--- | :------------------------------------------------------- | :----------------------------------------------------------- |
| 1    |                                                          |                                                              |
| 2    |                                                          |                                                              |
| 3    |                                                          |                                                              |
| 4    |                                                          |                                                              |
| 5    |                                                          |                                                              |
| 6    |                                                          |                                                              |
| 7    |                                                          |                                                              |
| 8    |                                                          |                                                              |
| 9    |                                                          |                                                              |
| 10   |                                                          |                                                              |
| 11   |                                                          |                                                              |
| 12   |                                                          |                                                              |
