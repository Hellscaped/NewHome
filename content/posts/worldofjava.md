+++
title = "World of Java"
date = "2026-02-14T18:53:31-06:00"
author = 'Riley "MaltedChoco" Thrailkill'
tags = ["java","fabric","minecraft"]
keywords = ["java", "fabric", "minecraft"]
description = "So, I've been writing a mod. An enchantment provider mod for Fabric 1.21.11 that operates purely serverside."
showFullContent = false
readingTime = true
hideComments = false
draft = false
+++

So, I've been writing a mod. An enchantment provider mod for Fabric 1.21.11 that operates purely serverside.

The name I've settled on is Articulate:\
"expressing oneself readily, clearly, and effectively" -Merriam-Webster

It was one hell of a ride getting started on it.\
I originally was using the vanilla enchantment component system and all of its benefits, but quickly outgrew it.

Let me clarify.\
My main goal is to write enchantments easily, and have them triggerable by multiple means.

One thing I realized while using the vanilla engine is that there is zero functionality to register your own trigger component.\
What the hell, Mojang?

So, I decided to write my own pipeline.

When I began to write it, I was repurposing my old EnchantmentEffect classes into generic trigger classes, to yknow, continue using vanilla triggers how vanilla does.

While testing, I realized I was triggering the same effect multiple times because I had to loop over the item's enchantments and trigger the corresponding code in my class. 

Basically in a nutshell, if I had two enchantments on a sword using PostAttackEnchantmentEffect (my generic for POST_ATTACK), it would trigger _four times_.

What?\
Four times?

Yup. Four times.

The effect triggers every time a mob is attacked, per enchantment.\
The problem with this is that it doesn't pass info about what enchantment is being triggered, so I had to resort to looping over ALL enchantments on the item.\
If I had two enchantments using the trigger, well, it would trigger twice and in each trigger it would call my methods.

I decided to entirely gut out the vanilla system from my code, only datagenning dummy vanilla enchantment jsons.

Now, I'm using the Fabric API's callbacks to call my methods and it works flawlessly. Extendable too, even.

I'm mirroring the pre-1.21 system for enchantment classes, and using an enchantment provider datagen class to pull information from these and generate a json for it.

For me, everything just Works™

Once I get the majority of the goals for my mod finished I plan on opening up the repo for it to the public.

See you next time!
