# 🏠 House Hunters - The Game

You're a real estate agent. Picky buyers walk into your office, tell you what they want (and hide a few things they *don't* tell you), and you dig through listings on **Roofline**, a fake realtor website, to find their dream home. Every listing sits on a **real street**, which you can explore in **Google Street View**. Present your top 3, take them on a showing, and hope they buy.

Play solo to build your career, or make a lobby with a code and play with friends.

---

## ▶️ How to start

**Easiest (Windows):** double-click **`Play House Hunters.bat`**. It starts a tiny local server and opens the game in your browser. Keep the black window open while you play.

**Any computer with Node.js:**

```bash
node server.js --open
```

**No Node.js?** Just double-click `index.html`. Everything works, though the map view may fall back to a different map style.

> You need an internet connection for Street View, maps, fonts and multiplayer. Solo play otherwise runs fully in your browser.

---

## 🎮 How to play

1. **Meet the client.** They tell you their budget, where they want to live, how many beds and baths, and what they need. It all goes into your **Client brief**.
2. **Ask questions.** On Normal and Hard, some wants are **hidden**. You get 3 questions (household, work, fun, dealbreakers, budget, timeline, fixer-uppers, style). Listen for hints like *"Sorry, I smell like dog"*.
3. **Search Roofline** on your computer: filters for price, beds, baths, neighborhood, commute time, monthly cost, HOA, schools, walkability, 30 features and "hide homes with…" options. Keyword search reads descriptions (some wishes only show up there, like a *walk-in pantry*). On Easy and Normal, every listing shows whether it **fits the brief** (based on what you know so far), and one click hides the ones that don't. Open listings to check the **brief check**, **disclosures** (foundation issues, flood zones, "sold as-is"), the **floor plan**, **satellite view** and real **Street View**.
4. **Pick up to 3 homes** (⭐), best first, and **present** them.
5. **Showing day.** Tour each home and watch the client react. They buy one, or none.
6. **Get paid.** A 2.5% commission, plus a speed bonus (if the timer is on) and a 5★ review bonus.

**First time?** The game greets you with a quick overview and a starter client on Easy. Tips pop up the first time you see each screen, pointing at what to do next. Turn them off (or bring them back) in **Settings**.

**Watch out for:** homes that are already **Pending**, busy streets, HOA rental bans, pet rules in condos, tenant-occupied homes when the client needs to move fast, and monthly payments over their limit.

### Difficulty
| | Hidden wants | Questions | Budget room | Homes that work | "Fits the brief" badges |
|---|---|---|---|---|---|
| Easy | none (plus an "Apply brief to filters" button) | unlimited | generous | many | yes |
| Normal | ~2 | 3 | moderate | a handful | yes |
| Hard | 4+, with complications | 3 | razor thin | 1–4 | only inside each listing |

### 📅 Daily Client
One new client every day, and **everyone gets the same one** (same city, homes and secrets). Your first attempt is your official result; copy it from the results screen and see which of your friends does better. Replays are practice.

---

## 🎉 Multiplayer (lobby codes)

1. One player clicks **Host a Lobby** and gets a **5-character code**.
2. Friends click **Join a Lobby** and type the code. Up to 8 agents.
3. The host picks the mode, difficulty, city, rounds and timer, then hits **Start**.

**Modes**
- **🥊 Rival Agents:** everyone meets the same client and races to present the best homes. The client buys from whoever brings the best match, and if two agents show the same house, whoever submitted first gets the sale.
- **🤝 Team Brokerage:** co-op. One shared shortlist, shared questions, shared commission. Changing the list un-readies everyone.

Multiplayer is peer-to-peer (WebRTC via PeerJS), so **no game server is needed**. But every player needs to open the game. Pick one:

- **Same Wi-Fi:** the host runs `Play House Hunters.bat`. The window prints a `Same Wi-Fi friends: http://192.168.x.x:8080` address for friends to open. Windows may ask to allow Node through the firewall; click *Allow*.
- **Over the internet (recommended): put the game online for free**
  - **Netlify Drop:** go to <https://app.netlify.com/drop> and drag this whole folder onto the page. You get a link like `https://something.netlify.app` to send to friends. On a hosted copy, the lobby also shows a **🔗 Invite link** button that drops friends straight into your lobby.
  - **GitHub Pages** or **itch.io** (zip the folder and upload it as an HTML game) work too.
- **Or** send everyone a copy of this folder. It works as long as everyone has the *same version*; the game checks this when you join.

---

## ✨ Features

- 8 cities, 49 neighborhoods, **2,000+ real house locations** (Austin, Denver, Columbus, Phoenix, Seattle, Nashville, Atlanta, Tampa), from single-family homes to downtown condos
- Real-world details come from OpenStreetMap: busy streets, highways and rail lines nearby, parks, schools, waterfront, corner lots, walkability and transit
- 14 client personalities (growing families, retirees, investors, dog parents, musicians, remote workers and more), each generated around a real home so **every round is solvable**
- Procedurally drawn listing photos, floor plans and characters; rush-hour commute times; monthly payment breakdowns; price history; HOA rules; pet policies
- Career mode with ranks (Rookie → Real Estate Legend), stats and 13 achievements, saved in your browser
- A Daily Client challenge with a shareable result and a day streak
- Built-in guidance: a step tracker at the top of every screen, first-time tips, highlighted client hints, and a brief check on every listing
- Lobby chat, live "who's ready" indicators, reconnect-safe heartbeats
- Synthesized sound effects and a mellow background tune (adjustable in Settings)

---

## 🛠️ Troubleshooting

- **Street View is gray or blank:** check your internet connection, then click the tab again. Every listing also has an *Open in Google Maps* link. A few addresses have no Street View coverage.
- **"Couldn't reach the matchmaking server":** the free PeerJS server may be busy; try again in a minute. Some school or work networks block peer-to-peer connections.
- **A friend can't join:** make sure the host is still on the lobby screen (you can't join a game in progress) and everyone has the same version of the game.
- **Reset progress:** Settings → *Reset career & achievements*.

---

## 📜 Credits & notes

- Street View, satellite and map embeds © Google.
- House locations and neighborhood features © [OpenStreetMap contributors](https://www.openstreetmap.org/copyright) (ODbL). Map tiles © OpenStreetMap, with an Esri fallback.
- Multiplayer: [PeerJS](https://peerjs.com). Maps: [Leaflet](https://leafletjs.com). Fonts: Fredoka & Inter (Google Fonts).
- **All listings, prices, owners, agents and clients are fictional.** House numbers are made up, so Street View's own address label won't match the listing. That's on purpose.

### Rebuilding the house data (optional)
```bash
node tools/fetch-osm.js .osm-cache
```
```bash
node tools/build-world.js .osm-cache
```
Edit `tools/world-config.js` to add cities or neighborhoods.
