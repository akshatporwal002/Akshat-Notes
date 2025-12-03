# 📱 App Concept – AutoSplit
### AI Receipt Scanner → Itemised Bill Splitter → Instant Apple Pay Settlement

## 🌟 Overview
AutoSplit is a mobile app that scans receipts, extracts items using AI, and instantly splits bills among friends. Once each person’s share is calculated, they can pay the organiser via Apple Pay, UPI, or card. Payments are routed through a platform account (via Stripe) and then paid out to the organiser.

**Goal:** Make splitting itemised bills **instant, accurate, and frictionless**.

---

## 🚀 Problem
Splitting bills is slow and annoying due to:
- Hard-to-read receipt photos
- Manual item assignment
- Lack of proper itemised split apps
- Payment apps not supporting itemised workflows
- Friends delaying payment

AutoSplit fixes this by doing **scan → parse → split → pay** in one seamless flow.

---

## 💡 Solution Summary
AutoSplit completes the entire bill-splitting workflow in under 10 seconds:

1.  Scan the receipt using the camera.
2.  Extract items and prices using **AI/OCR**.
3.  Assign items to each friend with a simple tap.
4.  Calculate totals per person, automatically including tax/discount.
5.  Friends pay instantly using **Apple Pay/UPI/card**.
6.  Organiser receives funds via **Stripe Connect** payouts.

---

## 🔧 Key Features

### 1. **AI Receipt Parsing**
- GPT-based OCR for high accuracy.
- Detects items, modifiers, taxes, and discounts.
- Cleans and structures messy receipt text.

### 2. **Smart Itemised Splitting**
- Tap items to assign them to individuals.
- Supports shared items and custom quantities.
- Smart suggestions based on past group behavior.

### 3. **Instant Payment Integration**
- **Apple Pay** and **UPI** support for zero-friction payments.
- **Stripe Connect** for secure, automated fund routing.
- Payouts are automatically routed to the organiser's account.

### 4. **Group & Sharing Flow**
- Create temporary or saved groups.
- Share a link for friends to view their assigned items and pay.
- Friends do not need an AutoSplit account to pay their share.

### 5. **History & Records**
- Save and archive past receipts.
- Export itemized splits to PDF.
- Track payment status (who has paid and who hasn't).

---

## 🟦 Payment Flow

### User Flow Sequence
1. Organiser pays the full bill.
2. Organiser uploads the receipt to AutoSplit.
3. App parses and splits the bill.
4. Friends receive a notification/link.
5. Friends pay their share instantly to the organiser via the app.

### Backend Flow (via Stripe Connect)
1. **Payer** initiates payment (Apple Pay/UPI/Card).
2. Funds are processed by **Stripe** and deposited into the **AutoSplit Platform Account**.
3. Stripe automatically initiates a **Payout** from the platform account to the **Organiser's** connected account.

### Fees
- **Apple Pay fee: 0%** (for the user)
- Standard merchant processing fees (Stripe/UPI/Card networks) apply to the transaction.

---

## 🎯 Target Users
- Friends splitting **restaurant or cafe bills**.
- Roommates splitting **groceries and utilities**.
- Travellers splitting **trip expenses**.
- Office teams sharing **lunch or event costs**.
- Parents managing **kids’ activity fees**.

---

## 🪙 Monetisation Options
- **Free Tier** + pay-per-receipt tokens for heavy users.
- **Monthly Subscription** (e.g., ₹99–₹299) for unlimited splits and premium features.
- Small **Processing Fee Markup** (e.g., 0.1–0.4%) on payments.
- **Business/Enterprise Plan** for larger organizations.

---

## 📈 Why It Can Succeed
- **Unique Selling Point:** No current competitor offers the complete **scan → itemise → split → instant pay** workflow.
- **Technology:** LLM OCR quality is now excellent and reliable.
- **Frictionless Payment:** Apple Pay and UPI integration dramatically reduce payment barriers.
- **Viral Growth:** The group nature of the app creates natural viral loops.
- **Feasible MVP:** A high-value core product can be built quickly.

---

## 🧱 MVP Scope (4–6 Weeks)
- Receipt scanning and item extraction.
- Manual item-to-person assignment.
- Apple Pay/Card payment button integration via Stripe.
- Automated payout to the organiser.
- Basic group creation and history tracking.

---

## 📌 Future Enhancements
- Automatic split suggestions (AI learns group habits).
- Real-time group collaboration on the split screen.
- Import digital receipts directly from email.
- Loyalty program integration (detecting points/rewards).
- AI chat interface for fixing OCR errors or complex splits.

---

## ⚡ Vision
Become the global standard for AI-powered bill splitting.
An automatic, fast, and seamless experience with **zero math and zero awkwardness**.
