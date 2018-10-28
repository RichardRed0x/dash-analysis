# Observations of the Dash Treasury DAO

This post considers DASH’s treasury model and history of proposal voting.
Relevant data and R code are in [this github
repository](https://github.com/RichardRed0x/dash-analysis).

This post is structured as follows:

* Introduction to Dash and the Treasury DAO
* Review of Treasury Proposals from August 2015 — January 2018
* Summary of relevant points for decentralized governance of development funds

DASH was I think the first cryptocurrency to award a portion of the block reward
to a fund which is administered by a Decentralized Autonomous Organization (DAO)
for the purpose of developing and promoting the project. There are other
projects that have a built-in funding mechanism, I’ve written about some of them
[here as part of a larger piece on
governance](https://medium.com/p/80fbe2050222#fc78).

#### The Dash Treasury

Masternode Operators (MNOs) are key actors in the Dash network. Dash Masternodes
(MNs) provide certain services (*InstantSend* and *PrivateSend*) to users,
receive 45% of the block reward, and collectively control the project’s
development fund through voting. A MNO can operate multiple MNs.

Each month, DASH dispenses 10% of the block rewards for that month in a
superblock. This DASH is distributed to the wallets associated with treasury
budget proposals which have scored highly enough to receive a payout. MNOs vote
Yes or No to proposals, on the basis of one vote per MN. There is a [voting
threshold which determines whether a proposal will be
funded](https://docs.dash.org/en/latest/governance.html#budgets-and-masternode-voting):
a net Yes vote greater than 10% of all MNs. The threshold formula is: (YES votes
— NO votes) > (Total Number of Masternodes / 10).

Every 30.3 days or so (16616 blocks) a superblock occurs and 10% of the previous
month’s block rewards are spent. All of the valid proposals which pass the
threshold are ranked according to net Yes-No score. Moving down this list, the
amount of DASH associated with each proposal is distributed to the nominated
wallet, until there isn’t enough available DASH to pay the amount requested by
any of the proposals which meet the threshold, or no more proposals meet the
threshold.

So, to receive funding:

* The proposal must have a net positive Yes score which represents at least 10% of
current MNs
* The proposal’s score must rank it highly enough to be paid with the available
DASH

Writing in late April 2017, DASH is distributing 6,176 DASH this month and
that’s worth around $3 million USD at a price of $480 per DASH. In January 2018
the treasury fund had 6,651 DASH to spend (worth around $4 million USD). Those
are considerable sums of money to have available every month for the development
and promotion of a cryptocurrency project. This money is available by default,
whatever DASH isn’t distributed gets burned. This gives the Dash MNOs a
considerable degree of freedom in how they deploy those resources.

Dash’s treasury governance model can be regarded as a DAO, and is probably one
of the first DAOs to serve its intended purpose for real over a sustained period
of time. This is fascinating to observe, and as most of the activity happens
publicly one can build up a good picture of how it works with enough time to
review the records.

It is however a fairly basic DAO, taking one form of input from MNs (Yes/No
votes) and applying simple calculations to decide which transactions get
included in a superblock. I like this simplicity, and that Dash were bold enough
to let it loose on the blockchain to directly control of 10% of their newly
minted currency. This simplicity imposes certain limitations though, which I
will consider below.

There are currently 4,769 MNs, and that places an upper limit on the number of
individuals who can be involved in operating the Dash DAO. In practice, MNOs can
own more than one MasterNode, and so the number of individual humans
participating in this governance is likely much smaller. MNOs have skin in the
game and are incentivized to make decisions which benefit the project. MNOs bear
all of the responsibility for these decisions, and are well rewarded through 45%
of the block reward. However, the relatively small number of MNOs imposes a
limit on the amount of human attention that is available for reviewing
proposals.

The kind of questions I set out to answer are:

* What kinds of proposals is this DASH spent on?
* What indicates whether a proposal will be successful or not?
* Do the MNOs get good value for money with their resources?
* Do they make good decisions when using this system?

A major source I have used for this is [Dash Vote
Tracker](https://dashvotetracker.com/past.php). I started with a list of 474
proposals submitted between August 2015 (when the DAO went live) until January
2018. I coded these proposals as falling into one of several categories, based
on an initial set of categories determined through eyeballing the data. These
categories were refined as I inspected the individual proposals and coded them.

All of the proposals on Dash Vote Tracker are linked to pages on
dashcentral.org. Dashcentral is not an official project website but it seems to
serve as one of the key public spaces for the treasury, alongside the Dash Forum
and Slack/Discord channels. A resource like Dashcentral is important for the
treasury because proposal descriptions are not included in the blockchain
representation of proposals, this is limited to a short title and required
meta-data.

I reviewed the description of the proposals on Dashcentral, and checked out the
comments when I wanted a better sense of why a proposal was accepted or
rejected. I also followed up on Dash forum threads referenced by proposals.
There is a pre-proposal board where people are encouraged to share their
proposal before they formally submit it.

Dash Central seems to be widely used by MNOs, currently 3,362 of 4,769 active
MasterNodes have registered for the site. There are an additional 1,255 users
registered on Dash Central who have not associated their account with a
MasterNode. This platform was until recently open for non-MNOs to join and
submit comments on proposals or vote up/down on those comments, but following
some issues with spam/trolls participation is now restricted.

[Dash Ninja](https://www.dashninja.pl/) offers a similar service to Dash
Central, with more detail on superblock payments but no proposal details or
discussion.

Formal submission of a proposal costs a fee of 5 DASH, this is currently around
$2,500 but has been over $5,000 on occasions. The fee is not refunded, but most
proposals include reimbursement of the fee as a line item in their budget. As
Dash’s value has risen, the 5 DASH fee has become a considerable barrier to
entry for submitting a proposal. This fee encourages prospective proposers to
discuss their proposal with the community and gain informal support from MNs
before making a formal submission. The fee also protects limited resources (MNO
attention for reviewing proposals, and blockchain space for their metadata) from
depletion.

A high fee also makes the treasury an inappropriate source of funds for projects
that would require a small budget.

There is some guidance for how to submit a good proposal
[here](https://docs.dash.org/en/latest/governance.html#steps-to-a-successful-proposal).
I could summarize my review of past proposal outcomes by saying that this all
seems like good advice for getting a proposal funded.

Over the course of this observation period, it has been interesting to watch the
MNOs encounter some of the problems which could be anticipated with this system,
and find solutions for many of these.

### Dash treasury proposals and voting from August 2015 to January 2018

#### **Overview of proposal outcomes**

There were 474 proposals submitted to the Dash treasury in this period. 295 were
approved and received all of the Dash they requested, 153 received nothing, and
26 received some but not all of the requested payouts.

Of the 153 rejected proposals, 83 (54%)had a net negative score (more MNs voted
No then Yes). Almost half of the proposals that didn’t receive funding had a net
positive score but either:

* didn’t meet the threshold of net approval from 10% of MNs, or
* were out-ranked by other proposals in their superblock

Of the 26 proposals that received part of their funding, the reasons for
cessation of funding are varied. The first two proposals submitted were by
eduffield (Evan Duffield, Dash founder), and they were each set for a long
duration of 100 months. The [public awareness
proposal](https://www.dashcentral.org/p/public-awareness) was funded for 9
months with a total of 19,404 Dash, while the [core team
proposal](https://www.dashcentral.org/p/core-team) was funded for 18 months and
received 21,168 Dash. In both cases, the proposals were effectively withdrawn by
eduffield to be replaced by new ones that served a similar purpose but with a
different approach. The public awareness proposal has been edited to say “please
downvote this proposal!”, and the MNs responded by downvoting it to a score of
-358. It seems like by the time the Core team proposal was replaced 9 months
later, some feature had been included which allowed eduffield to end the
proposal early without having to mobilise MNs to downvote it.

<span class="figcaption_hack">Stacked histogram showing the yes-no scores of proposals, colored by Approval
status. Excludes 8 outliers</span>

#### **Dash/USD**

Over the course of the observation period, the amount of DASH available for
distribution each month has been decreasing in line with decreasing inflation,
but the value of the distributed DASH has tended to increase. The first
superblock paid out 5,861 DASH in September 2015, which was worth $13,656,
whereas the January 2018 superblock paid out 5,180 DASH but this was worth $3.1
million USD.

To consider how the treasury funds have been spent it is important to consider
their USD value, but this is not straightforward. Some proposals run for several
months, and so the total USD value they receive may be quite different than the
USD value as estimated at submission. I have opted to link DASH sums to USD
values in a very basic way because I only need a rough sense of how much USD a
proposal was paid. I took daily closing prices from coinmarketcap for September
2015 to January 2018 and used the median for each month to set the USD cost of
proposals submitted in that month.

Following this basic approach, the total amount of DASH awarded in the
observation period (168.5 k) was worth around $20 million USD at the times when
it was distributed.

The Dash treasury operates exclusively in DASH, it has no mechanism to peg
proposal awards to an alternative and more stable currency. A more stable
national currency like USD is better for budgeting, and most proposals include a
budget denominated in USD which is then converted to DASH. This can cause
problems, especially for proposals that run for several months. If the price of
DASH declines those proposals receive less than they budgeted for and may not be
able to deliver what they had promised. If the price of DASH increases then the
proposer would have more budget than they requested, which is great for them but
not so great for the MNOs. Many proposals now include contingency planning, how
they will adapt their work if the price of DASH increases or decreases.

#### **Who submits successful proposals?**

It is interesting, but not surprising, that many of the early proposals to be
funded were submitted by eduffield (founder) and babygiraffe (Ryan Taylor, Dash
Core CEO). eduffield submitted 27 proposals, 19 of these were paid at least
partially and these payments amounted to 61.5K DASH or $153K USD. babygiraffe
submitted 111 proposals, 90 of these were paid at least partially and these
payments amounted to 46.7K DASH or $2.67 Million USD.

<span class="figcaption_hack">The percentage of Dash allocated to new proposals from eduffield and babygiraffe
per month.</span>

It makes sense that a project with a built-in funding source but no official
pre-mine or endowment would start off by giving control of this funding stream
to the “Core team”. Where this departs from a token sale or pre-mine is that the
MNOs could de-fund the core team at any point if they lost faith in that group.
This hasn’t happened yet, the Core team’s share of the budget has declined
because their funding needs have not increased as quickly as the price of DASH,
but the MNOs still seem happy to fund any reasonable request by the Core team.

More generally, the MNOs are more likely to fund projects that come from people
they know and trust. People or organisations that have received funding in the
past and been seen to use it well, are more likely to have future proposals
funded.

Amanda B Johnson is a good example of someone who established a reputation with
the MNs for delivering good value for money on her proposals. Amanda started
fairly small with proposals that asked for a few thousand USD for youtube
content, then started pitching more ambitious proposals with larger budgets. By
the end of the observation period, Amanda’s proposals had received 2,609 DASH
worth around $178K USD when it was received. Based on comments on Amanda’s
proposals on Dash Central, most of the MNOs seem to regard this as money well
spent.

**Do treasury-funded proposals produce good outcomes?**

Trust in proposers is important, as the Dash DAO defaults to payment up front.
This offers little protection from proposers who don’t deliver on their
proposals after receiving payment. This theme often comes up in the
communications of MNs, but it is quite difficult to quantify the extent to which
proposers fail to follow through with their plan. Some proposers do report on
their efforts, generally to establish themselves as reliable for subsequent
proposals (and sometimes within the description of those subsequent proposals).

It is difficult to get a sense of whether proposals from one-off proposers
produced good outcomes, because if they don’t return with another proposal there
is nothing to focus a discussion and vote which reviews their previous work and
reflects how MNOs felt about the initial proposal’s outcome.

A few proposals have failed noisily. I’ve heard the term “Shrem attack” used in
a general discussion of development subsidy governance . This relates to a
proposal by CharlieShrem to deliver “ [DASHPayCard — DASH Branded Debit Card +
Fiat/Dash Integration](https://www.dashcentral.org/p/DASHPAYCARD-DEBIT-CARD)”
for a one-time fee of 450 DASH (worth about $38,000 in March 2017). DASHPayCard
was never delivered, and the subject periodically crops up on
[twitter](https://twitter.com/TheDesertLynx/status/974337036722360322) and the
[Dash
subreddit](https://www.reddit.com/r/dashpay/comments/7pa955/450_dash_was_given_to_charlie_shrems_debit_card/).

#### **Efforts to improve funded proposal outcomes**

The MNOs have found several ways to mitigate the problems associated with
up-front payments.

The most obvious of these is the use of escrow providers — trusted members of
the Dash community who receive the funds from the superblock and distribute
these to the proposer as milestones are met. Where significant sums of money are
involved, it is now common for a proposer to make an arrangement with an escrow
provider before submitting their proposal. There are several channels on the
Dash Discord for making escrow arrangements. The use of an escrow provider isn’t
well captured by the data I have, it’s usually noted in the description and
sometimes the proposal owner is the escrow provider. greencandle seems to be the
main escrow provider now, they have administered 5 successful proposals worth
around $1.1 million at time of submission.

The Dash DAO’s effectiveness was also limited, until recently, by the fact that
it had no legal personality. The DAO itself could not hold ownership of assets
or enter into contracts. The lack of a contract between the DAO and proposers
meant there was very little recourse when a recipient of funds failed to deliver
on their proposal. In February 2018, [a legal entity was formed which represents
the DAO, and this entity took ownership of Dash
Core](https://www.dashforcenews.com/dash-core-group-becomes-first-legally-dao-owned-entity/).
This opens up new possibilities for proposals that seek large sums of money, to
decrease the perceived risk by entering into a contract with the DAO.

The Dash DAO has historically suffered from a lack of follow-up once proposals
are funded. In November 2017 [a
proposal](https://www.dashcentral.org/p/Dash-Watch) was funded to establish
[Dash Watch](https://dashwatch.org/). The Dash Watch proposal funded development
of a website to track the progress and outcomes of funded proposals. It also
funds staff to do the work of communicating with proposal leaders, seeking
updates and publishing these on dashwatch.org. This is one of my favorite
proposals, because it serves an obvious need for the DAO and will gather data
that I’m interested in on proposal outcomes. The proposal pitched for funding of
$24K USD, 70 DASH per month for 3 months — that seems like great value for money
to me. Perhaps unsurprisingly, the proposal came from someone who had been a
community member for some time and had already worked on a project of their own
related to Dash without treasury funding.

This does however seem like a scaling back of the ambition to be a fully
decentralized autonomous organization. The tasks of reviewing the work of
contractors, deciding when conditions for payment have been met, and reflecting
on the value that someone’s proposals are adding, are important facets of
running this organization well, and they are effectively being outsourced.

In a similar vein, the MNOs have voted to fund [a proposal from the Mason
Brothers which evaluates incoming proposals and produces a video evaluating
them](https://www.dashcentral.org/p/Proposal-Reporting). The funding in this
case is relatively modest, 20 DASH per month for 3 months, so around $6k when
the proposal was submitted. This is quite an interesting proposal to me, because
the MNOs are paying for a kind of research service, but in turn the provider of
that service has some power to influence the MNOs votes. In principle, the
providers of this kind of service may be susceptible to bribery from proposal
creators, because they have little stake in the outcome of proposal approval
decisions.

#### Proposals that benefit the MNOs directly

There have been a number of proposals which aim to directly aid the MNOs in
running the Dash DAO. I flagged 8 proposals as providing a direct benefit to the
MNOs, but I wasn’t applying this flag until later in the coding process and may
have missed other relevant proposals.

For example, [DashMasternodeTool development
boost](https://www.dashcentral.org/p/dash-masternode-tool-development-boost):
received 66 DASH in October and November 2017 superblocks (132 DASH total, worth
around $22k at proposal submission). This proposal sought funding to develop a
tool for MNOs with features like:

* starting a masternode using Trezor/Keepkey hardware wallets,
* sending funds earned by the masternode in a way that keeps the 1000 Dash
collateral secure
* voting on proposals
* signing messages with a hardware key, checking masternode status etc.

This was a follow-on to a successful earlier proposal: [Easy and secure
Masternode starting from web browser and hardware
wallet.](https://www.dashcentral.org/p/secure-dash-run)

Most of the proposals I flagged which provided a benefit only to MNOs have been
rejected.

#### **What type of proposals are submitted/funded?**

My process for categorizing the proposals was as follows:

* Skim through all of the proposals to get a sense of what they’re about.
* Start from the beginning chronologically and assign categories that make sense.
* Re-evaluate categorizations on the fly, if some new type becomes prominent add a
category and go back to re-code previous proposals. *Events* is an example of
this, to start with I was just labeling those *Marketing*, but there were enough
proposals about attending events that they warranted their own category.
* I aimed to find a balance between having too many categories with a few
proposals each, and lumping different kinds of proposal together.

Here’s how my categories shake out:

<span class="figcaption_hack">Stacked bar chart showing number of proposals per category, color-coded by
approval outcome.</span>

The thing that stands out is the number of proposals that relate to Marketing
and Events, together these categories account for more than half of the
proposals.

I will review some of the categories that were associated with minimal spending,
before going on to consider the DASH/USD spend on proposals by category.

**Miscellaneous/Mistakes**

I categorized 13 proposals as Miscellaneous.

Six of these proposals are an attempt to
[Catch](https://www.dashcentral.org/p/catchall-1024)
[Leftover](https://www.dashcentral.org/p/catchall-128)
[Funding](https://www.dashcentral.org/p/catchall-512) by eduffield. These
proposals were intended to sit at the threshold of acceptance, right at the
bottom of the list of passing proposals, so that they could collect the DASH
which was left over (i.e. not enough to fund any of the passing proposals)
instead of this DASH being burned. This DASH would be used to further fund the
Core team. The proposals were rejected by MNs and never paid out.

One proposal was an [obvious
troll](https://www.dashcentral.org/p/Unicorn-Rainbo-Ass), satirizing proposals
in general and I think some specific proposal/incident particularly. That’s the
only proposal I know of which could be classed as deliberate spam/trolling. The
5 DASH fee to submit a proposal seems to work fairly well in that regard. When
the troll proposal was submitted in July 2016 that was worth $50, the fee is a
more effective deterrent now that it equates to more than $2,000.

It is however possible that Dash Central or the vote tracker censors proposals,
I haven’t consulted the blockchain to check that all historical proposals are
represented in that data-set.

Having the proposal system wired directly into the Dash blockchain causes some
other issues. Three of the Miscellaneous posts are mistakes, and I don’t know
what they were originally about because the entry on Dash Central has been
edited to say some version of “[Vote
no](https://www.dashcentral.org/p/591-soda-machine), [this is a
mistake](https://www.dashcentral.org/p/Proposal-36DashSponsorships)”.

In total, there are 14 proposals that I have classified as Mistakes based on
edits to the Dash Central description. That’s 70 DASH which was wasted. Weighted
by the price of DASH at the time of proposal submission, about $26k. I get a
sense from some of the comments that it’s not uncommon for some MNOs to manually
reimburse a proposer their 5 DASH fee in cases where they made a mistake with an
otherwise solid proposal.

Proposals classed as mistakes or miscellaneous have been removed from subsequent
analysis.

**Governance**

There were 13 proposals related to Governance, and most of these didn’t request
any DASH beyond 5 to reimburse the proposal fee (almost every proposal includes
this as a line item).

At least two of these proposals related to protocol changes. This proposal to
[increase the block size
limitation](https://www.dashcentral.org/p/2mb-blocksize) was passed, signalling
that the MNOs supported the increase, that Devs should implement it and Miners
should adopt it. Another proposal to [change the PoW algorithm because of
ASICs](https://www.dashcentral.org/p/change-X11) was rejected.

There were at least two proposals that amounted to policy statements. <br>
[Privacy first vs transparency
first](https://www.dashcentral.org/p/Privacy-Transparency) (rejected)and [When
the minimum price of an average transaction rises above 1 cent, should we lower
the transaction
fee?](https://www.dashcentral.org/p/should_we_lower_the_transaction_fee)
(approved).

There were three proposals to lower the proposal fee; to [0.1
DASH](https://www.dashcentral.org/p/Reduce_proposal_fees_to_dot1_DASH), [1
DASH](https://www.dashcentral.org/p/REDUCE_PROPOSAL_FEES_TO_1_DASH), then [make
it adaptive](https://www.dashcentral.org/p/Adaptive-Proposal-Fees). The first of
these was obviously rejected, with a net score of -647. The other two are in
more of a grey area, they had a positive score but weren’t “funded” because they
didn’t achieve a supermajority of Yes votes that represented 10% of the MNs, but
they weren’t really asking for funding. It is however clear that they failed,
because the proposal fee is still set at 5 DASH.

The level the proposal fee is set at influences the whole system. As the price
of DASH has increased, smaller scale projects that would require small sums of
money are being excluded. Why would anyone risk $2,000 of their own money to
seek funding for a project that had a budget lower than $10k or $20k?

This has been a fairly deliberate choice by the MNOs, they don’t want to have to
deal with a lot of small-scale projects. You can see comments to this effect on
some of the proposals.

The fact that this 5 DASH fee is applied to every proposal also limits the
system’s utility for making governance decisions. There can’t be too many people
for whom it makes sense to throw down $2,000 just to run a non-binding poll of
the MNOs. Someone (Technologov) wasted $700 on asking that the proposal fee be
reduced (twice).

This is however another example of an issue where someone has recently brought a
compelling solution to the MNOs. The [Dash Boost
proposal](https://www.dashcentral.org/p/gc-dash-boost) sought (and received) 158
DASH (around $158k at the time) over three months to establish [Dash
Boost](https://www.dashboost.org/) — a sub-treasury for micro-proposals. The
first cycle ran [in April with a total budget of 2 DASH, a maximum request per
proposal of 0.25 DASH and a proposal fee of 0.025
DASH](https://www.dash.org/forum/threads/dashboost-official-launch.36297/#post-182973).
Anyone with a minimum of 1 DASH can participate in voting, for micro-proposals,
on the basis of 1 vote per DASH. The micro-proposal funding comes from the
surplus in an escrow provider’s wallet — which I guess means it comes from the
DASH awarded to proposals which didn’t meet the requirements to claim it. The
intention is to make Dash Boost self-sustaining through the collection of
proposal fees.

**Liquidity**

Nine proposals were submitted for a liquidity provider, the eight which were
funded came from eduffield and babygiraffe. These proposals were funded for 21
months and received a total of 677 DASH (worth $3.3k at the time).

**Research**

Five proposals have been submitted which I classed as Research, they involve the
proposer doing some research on a subject relevant to Dash and the MNOs and
producing a report. Four of these proposals were funded, they received 868 DASH
(worth $56.5k at the time).
[This](https://www.dashcentral.org/p/UnderstandingthebarrierstoadoptionofDash)
is a good example.

#### **Where did the DASH go?**

The remaining categories accounted for 99% of all the DASH distributed by the
treasury, and 96% of all the USD value. Categories like Core Dev, Support/Docs
and Organization have much higher DASH awards relative to USD value because they
received more funding early in the observation period, when DASH was relatively
cheap.

<span class="figcaption_hack">Total amount of DASH awarded and $USD equivalent at time of award by proposal
category</span>

**Marketing ($11.4 Million)**

Of all the Dash treasury funds that have been spent, 40% of the DASH (58% of the
$USD value) has been spent on various forms of marketing, promotion, and
advertising. The 5 Marketing proposals to receive the most $USD funding are as
follows:

1.  [Ben Swann’s Reality Check Sponsorship &
Ambassador](https://www.dashcentral.org/p/Ben-Swann-Reality-Check-Relaunch) —
2,400 DASH in December 2017 (around $2.4 million using my basic estimate, but
the proposal actually quoted $2.8 million). [Ben
Swann](https://en.wikipedia.org/wiki/Ben_Swann) hosts a show called Reality
Check, it is quite controversial, investigative reporting on conspiracy theories
as far as I can tell. This proposal was submitted by Ben Swann himself, and
sought funding to produce 24 episodes of Reality Check, with Dash getting a
range of sponsorship type benefits and Swann becoming a “Dash ambassador”. This
was the single most expensive proposal to be funded, by some margin.
1.  [DASH To Sponsor “HardFork”, World’s Premiere Blockchain TV
Series](https://www.dashcentral.org/p/DASHToSponsor-PremiereBlockchainSeries) —
810 DASH in December 2017 (split over 2 months, worth about $810k USD).
“HardFork is a crypto-noir thriller set in a near future world where
decentralized factions work to overthrow their society’s centralize regime.”
This proposal narrowly scraped through, and so the Dash DAO funded a sci-fi TV
series which will run for eight episodes and feature Dash pretty heavily.
1.  [Dash Aerosports — Promoting Dash to 200,000
People](https://www.dashcentral.org/p/gc-dash-aerosports) — 1,366 DASH in
November 2017 ($584 k). Just like it sounds, covering some impressive looking
acrobatic aircraft in Dash branding to be seen by hundreds of thousands at the
events where they perform. This is one
[of](https://www.dashcentral.org/p/DashBrandingonRaceandAcrobaticairplanes)
[three](https://www.dashcentral.org/p/Dash_AeroSports_Zero_Funds_Requested)
proposals by DashAerosports to be funded by the treasury. The proposal that paid
out around $584k was actually the second by DashAerosports, the third proposal
is requesting zero DASH but rather to draw down on a reserve which was held by
the escrow provider for the second proposal. Withdrawals from the escrow
provider (greencandle, official submitter of the second proposal) seem to have
been denominated in USD, so that as the value of DASH increased over the term of
the agreement the payouts had been for smaller sums of DASH than anticipated.
The third proposal seeks approval to continue the project and draw down on the
reserve. That’s a total of around $755k that’s been allocated to DashAerosports
over three proposals, so the MNOs obviously regard this as being good value.
1.  [Increase Dash’s awareness by advertising on
YouTube](https://www.dashcentral.org/p/strike-social-youtube) —900 DASH
requested over two months in January 2018 ($560k). This proposal was actually
de-funded after the first month, so it only received $280k and shouldn’t even be
in this top 5. This proposal is interesting though as a rare example of the MNOs
de-funding a proposal without being asked to by its owner. In this case it was a
maybe not totally deliberate de-funding, because the proposal still met the
funding criteria it had just been pushed down the ranks too far to receive any
of the available DASH.
1.  [DASH-GAP](https://www.dashcentral.org/p/dash-gap) — 2000 DASH in August 2017
(about $448k). “Max Keiser + Stephen Baldwin are doing 16 episodes of a new
road-trip show traveling America’s heartland. We would like DASH to sponsor and
fund this trip in return for product placement + on-air and in digital. RT
Network is an English-language Russian international television network, that is
available in over 100 different countries, with an audience of 700 million,
including 85 million in the United States.”
1.  (or 5, based on funds actually disbursed)[Let millions of Chinese investors on
Huobi invest Dash](https://www.dashcentral.org/p/dash-on-huobipro) — 1005 DASH
in November 2017 (about $430k). This is an odd proposal, because the promises
don’t line up so well with the requested budget.

> **3. What will we do?**

> a. Exchange. We will list Dash/BTC and Dash/USDT trading pairs on Huobi.pro and
> create millions of Dash hot wallets for our users and cold wallet for our
platform.

> b. Air drop. We will air drop Dash to all our bitcoin and litecoin traders,
> encourage them by this to use Dash, experience the Speed, try it out and see the
difference in Dash and its technology. We will launch promotions to introduce
Dash to our users and make them well aware and educated in Dash.

> c. Marketing. We will post announcements on our website and Social Media which
> will be exposed to our millions of users, Dash will definitely get more popular
in China. Huobi’s marketing channel will includes:

A and C seem valuable to me, B not so much. But:

> **Above all, we’d like to request 1005 Dash for our proposal.**

> 1. 5 Dash reimbursement for the proposal cost.

> 2. 1000 Dash for air drop (see Point 3.) to our bitcoin and litecoin users, who
> are our active trading users on our exchange. There are hundreds of thousands of
active bitcoin and litecoin trading users. Each of them can get about
0.001–0.01Dash.

> 3. Extra marketing and technical development costs (integration) will be handled
> by Huobi ourselves.

Looking at the proposal comments and [linked forum
post](https://www.dash.org/forum/threads/pre-proposal-let-millions-of-chinese-investors-on-huobi-invest-dash.17812/page-4#post-145974),
there is some confusion about what the requested DASH is for, as it seems that
Dash is already integrated on Huobi. Many of the participants in these
discussions are critical of the idea of airdropping 1000 DASH into the exchange
accounts of Huobi traders. The decision to fund this proposal doesn’t make a lot
of sense to me. It’s possible that some private deal may have been done for Dash
integration, and funding the proposal is holding up Dash’s end.

Many of the larger marketing proposals were funded at a time when the price of
DASH had just seen a sharp increase. I think part of the reason so much of the
Dash treasury budget has been spent on marketing is that it’s easy to throw
money at these kinds of proposal in anticipation of some sort of return. This
contrasts with software development work, where finding out you have an extra $1
million to spend this month (and it’ll be burned if you don’t spend it) doesn’t
help a great deal because of on-boarding costs and a scarcity of developer
talent.

**Events ($2.1 Million)**

This category represents proposals to fund a Dash presence at and/or sponsorship
of events. These could probably have been lumped in with marketing, but they
represent about $2 million in expenditure. [This proposal for a Dash-dedicated
conference in London](https://www.dashcentral.org/p/conf-dash-201708) was the
single biggest Events expenditure — it is a good exemplar of the Events type,
but usually the proposals involve attending/sponsoring existing events rather
than creating new ones.

**Support/docs ($250k)**

This category covers a range of proposals that establish some kind of
information resource for the benefit of the Dash community and potential
adopters. Around $250k was spent on these proposals.

I mentioned [Dash Watch](https://www.dashcentral.org/p/Dash-Watch) above, that’s
the highest USD value proposal in this category. It also includes proposals
funding [a Slack upgrade](https://www.dashcentral.org/p/upgrade-dash-slack) for
Dash, the [purchase of Dash.org](https://www.dashcentral.org/p/dash-org), and
[Dash radar](https://www.dashcentral.org/p/DashRadar-development), a set of
tools for analyzing the Dash blockchain.

**Organization ($250k)**

Proposals to cover funding of organizational costs like:

* [Recruitment costs](https://www.dashcentral.org/p/hr-recruiting-022018)
* Costs for [legal advice](https://www.dashcentral.org/p/legal-201609), and
[setting up the Dash foundation](https://www.dashcentral.org/p/foundation-pt-2)
* [Paying for office space](https://www.dashcentral.org/p/offic-skysong-201701)

**Adoption ($2.1 million)**

These are proposals which have the direct aim of facilitating and promoting Dash
adoption. The top two Adoption proposals receiving the most USD equivalent have
done things like:

* [Build a network of Dash ATMs (1973 DASH in October 2017,
$580k)](https://www.dashcentral.org/p/Proposal-36-Dash-ATM-Sponsorships)
* [Kuvacash — Launching Dash in
Zimbabwe](https://www.dashcentral.org/p/DASHKuvaCashProject) (3 payments
totaling 1,695 DASH, worth around $560k at time of proposal submission). This is
an interesting and ambitious project to set up a mobile wallet and supporting
infrastructure to allow Zimbabweans to easily obtain and transmit Dash. It is
interesting and not unsurprising to note that a number of successful proposals
have targeted countries with serious inflation issues as good places to promote
the adoption of Dash. This Kuvacash proposal is phase 1 of a multi-phased
project, with the second phase [currently being voted on for treasury
funding](https://www.dashcentral.org/p/KuvacashBaseFunding002).

**Integration ($1.3 Million)**

These are very similar to the Adoption category but they have a bit more
emphasis on developing (software) infrastructure to support adoption.

**Non-Core Dev ($516k)**

Proposals for funding software development work through contractors other than
the Core team. The proposal funded with the most USD equivalent was to [fund
development of a real-time strategy browser
game](https://www.dashcentral.org/p/browser-game-powered-by-dash) (261 DASH,
worth around $81k at time of submission). Proposals in this category tended to
be for smaller sums, other illustrative examples are for a [Dash Bug Bounty
Program by
BugCrowd](https://www.dashcentral.org/p/Dash-Bug-Bounty-Program-by-BugCrowd) and
[MyDashWallet: Easy Wallet Creation, Management, Tipping and Hardware
Support](https://www.dashcentral.org/p/MyDashWallet).

**Core Dev ($960k)**

The Dash Core development team was funded through a [long-term
proposal](https://www.dashcentral.org/p/core-team) disbursing 1,176 DASH per
month, it ran until February 2017 and made 18 payments. My basic approach to
estimating USD value falls down a bit here because the price of DASH increased
considerably between the proposal’s first and last payments.

As part of a transition away from long-term proposals that pay out the same
amount of DASH each month, the Core team switched to making proposals for
funding as and when they’re needed. In March 2017 [a proposal was submitted
asking for 397 DASH for the Core team
salaries](https://www.dashcentral.org/p/core-salaries-201704), along with
[another proposal asking for funding to significantly expand the Core
team](https://www.dashcentral.org/p/core-expansion-201704).

It has been interesting to observe how core development work has been funded.
This started with a blanket proposal paying out a set amount of DASH per month,
then at one point many more specific proposals started to appear which sought
funding for relatively minor expenses. The current model is somewhere in
between, with new proposals appearing whenever the Core team’s coffers are
running low or an expansion is planned.

In principle, these proposals allow the MNOs to exert some control over the Core
team. If the Core team were to disregard the MNOs wishes, the MNOs could deny
their funding requests.

### **Final observations**

#### **Masternode participation**

The participation rate of MNs in treasury voting does not seem to be all that
high, when one considers that each MN has a considerable stake in the project
and significant sums of money are involved. There are currently 4,765 MNs, I
don’t have any historical data for this but it has likely been lower in the
past. The median number of votes on a proposal is 807, which is just 17% of the
current number of MNs. However, it should be noted that proposals which are
obviously failing often have lower numbers of votes. MNOs don’t seem to bother
wasting their time voting No on something which will be rejected anyway.

<span class="figcaption_hack">Histogram showing number of votes per proposal</span>

**Edit:** Two (I think) different people have contacted me to say that [this
page](http://178.254.23.111/~pub/Dash/Dash_Info.html) has historical data on
number of masternodes. I have taken rough figures per month from that graph and
used them to express the votes on each proposal as a percentage of active MNs.
The median percentage of MNs voting on each proposal is 18.7%.

<span class="figcaption_hack">The proportion of MNs who voted on each proposal (excluding abstentions)</span>

With the current number of MNs at 4,765, together they control around 59% of the
circulating DASH. Each MN represents around 0.012% of all the circulating DASH.
Without a direct incentive to vote, maybe this is not enough of a stake to
warrant careful consideration and voting on all of the submitted proposals.

#### **Multi-month proposals**

Relatively low participation also results in some inertia for funded proposals.
Once a multi-month proposal has been funded it is relatively uncommon to see it
lose funding before it has received all of its payments. Of the 89 proposals
that sought funding for more than one month and whose funding cycle had
completed by April 2018, 71 (80%) received all of the requested funding. Of the
18 proposals whose funding was cut, in some cases [the proposal owner asked for
it to be de-funded](https://www.dashcentral.org/p/public-awareness). There are
also several cases where the proposal’s score didn’t drop below the payout
threshold but it was outranked by other proposals and therefore not funded. Only
half of the de-funded proposals have a final yes-no score which is negative.

MNOs don’t often show a deliberate change of heart about a proposal they’ve
decided to fund.

#### **Small but effective proposals**

When reading through the proposals, my impression has been that a lot of value
comes from proposals that modestly fund some team or service on an ongoing
basis. A lot of the examples I’ve highlighted as in my view good value are like
this.

There’s another such example which hasn’t come up so far, **Dash Force**. The
[first Dash Force proposal ](https://www.dashcentral.org/p/Dash-Force)envisioned
a social media outreach team composed of named community members, but it was
rejected. A [subsequent proposal from a different proposer
(Mastermined)](https://www.dashcentral.org/p/Dash_Force_Reloaded) reformulated
the concept slightly (mostly around how individuals participate) and this
passed. The following quote describes some of the activity of Dash Force
(emphasis is mine):

> *Dash Force members will tip community members, core team members and slack
> users/mods who are quick to answer questions in the Slack channels, The DASH
forum, BTCtalk and Reddit etc. *People will also be tipped for posting links to
positive/negative threads and articles so we can quickly organize swarms to go
upvote/downvote and comment.* Dash force members will organize all this and take
the lead to get everything started. This is a real problem on reddit (and
youtube etc) where dash members comments and threads are constantly getting
voted down and people who scream stuff like “Dash is a scam” are getting voted
up. If we tip people for helping answer questions we will eventually create a 24
hour decentralized help desk across all social media platforms/forums. If we tip
people for participating in testnet we will have a much more robust testnet with
lots more participation. If we incentivize everything Dash we will inspire an
army of new Dash supporters and energize the current Dash community.*

The swarming of up/downvotes is a bit shady for my liking, but the rest of it
seems solid enough.

Dash Force went on to have
[four](https://www.dashcentral.org/p/DASHFORCE_RELOADED_2)
[more](https://www.dashcentral.org/p/DASHFORCE_RELOADED)
[successful](https://www.dashcentral.org/p/Dash_Force_old1)
[proposals](https://www.dashcentral.org/p/DASH_FORCE) which each funded the
project for a number of months, and [a proposal for further funding is live
now](https://www.dashcentral.org/p/Dash_Force_May). The purview of Dash Force
has evolved over time, and it now incorporates a [Dash Force News
website](https://www.dashforcenews.com/), which has been successfully putting
itself about, based on the anecdotal evidence that I’ve seen links to it in
various places.

The proposals funding Dash Force have so far dispensed about $217k USD
equivalent, which is not cheap but that covers about 16 months from December
2016 to present.

The cost of big marketing/sponsorship proposals like Ben Swann’s Reality Check
dwarfs something like Dash Force, costing ten times as much for a three month
sponsorship.

#### **Is the Dash treasury a Decentralized Autonomous Organization?**

I would say sort of, but a very basic one that relies on people taking on direct
responsibility for a specific set of roles to boost its efficacy. You could
describe exactly what the Dash DAO does, autonomously, with a few sentences and
a simple equation. It sends DASH to addresses based on the outcome of a MN
voting process. That leaves quite a few gaps in terms of how a successful
organization like this operates. What it comes down to is trust, the system only
works if you can trust the recipient of the DASH to do what they proposed with
it. Proposals are only successful when a) the proposer receives the DASH
directly and can be trusted to use it appropriately, or b) the DASH goes to a
trusted escrow provider, who can be trusted to perform their duty of checking
deliverables faithfully.

There’s another aspect of this question which to my knowledge can’t be
addressed. Knowing how “decentralized” this autonomous organization is depends
on knowing about the distribution of DASH and MNs between individuals. If one
individual controlled 60% of DASH, or more specifically 60% of the DASH that is
tied up in MNs, they would have full control of the DAO and could make any
decision they wanted unilaterally, by voting with as many of their MNs as
necessary.

#### **Summary points for other blockchain projects with development funds and the
intention to decentralize their spending**

* Some system of pegging the native asset to national currencies is useful while
the native asset’s value is volatile. It’s too easy for a Dash proposer to end
up with a windfall or shortfall because of price fluctuations.
* Payment up front has a lot of issues, and decentralizing escrow, or the release
of funds upon completion of work, is hard.
* The mechanism for preventing spam is important. A fee to submit proposals seems
to work quite well, but the level that fee is set at has a big influence on the
type of proposals that will be submitted.
* The attention and expertise of decision-makers are limiting factors. People have
limited time to spend reviewing funding proposals, and their expertise tends to
be limited to certain domains. Individuals who reliably bring an informed and
unbiased perspective on proposals in some domain would be valuable assets. These
individuals, when recognized as such, will tend to exert significant influence
on decision-making. Liquid democracy (or delegative democracy) is interesting to
me as a way of automating or formalizing something that decision-makers will
tend to do anyway — trust the judgment of certain others in certain domains. It
may have its own problems, stemming from power vested in elected delegates.
There are a number of blockchain projects that plan for liquid democracy to play
a central role, I’m looking forward to seeing how these play out, and I’m
cautiously optimistic.
* It’s probably not practical or desirable to do everything on-chain. The
associated off-chain services, social spaces and practices are very important.
* The way the monthly superblocks work seems far from ideal. The Dash DAO has no
capacity to save up DASH in months when there aren’t as many good proposals. A
proposal’s fate often depends on the strength of its direct competition (i.e.
the other proposals submitted in the same month).
* For a DAO like this to be effective it needs to be capable of learning from its
mistakes to make better decisions. It needs to function as a coherent social
superorganism to some degree.
* As the entity/counterparty which contributors will deal with, it also needs to
maintain a reputation for integrity and fairness. Any perception of dishonorable
conduct by a DAO could cause significant damage. There is no CEO to fire or
other way to signal that the organization is “under new management”. Dash seems
to have done quite well in this regard, I’ve seen few to no complaints from
disgruntled proposers, but maybe I didn’t look in the right places.
* Transparency seems key to a system that works well. When the pool of
decision-makers is large and there is no private channel where they can
coordinate, relevant information has to be openly accessible. This likely
creates issues with any proposal that involves private negotiation of terms.
* Once something medium/long-term is funded, it is fairly resistant to deliberate
de-funding.
* Long-term funding of small-ish teams that have a long-term engagement with the
project seems to me to provide better value for money than big one-off payments
to external parties.
