Scriptname CACO_AdjustPotionThreadManager extends Quest  

Quest property CACO_AdjustPotionQuest auto

int property thread_limit = 30 auto hidden

CACO_AdjustPotionThread01 thread01
CACO_AdjustPotionThread02 thread02
CACO_AdjustPotionThread03 thread03
CACO_AdjustPotionThread04 thread04
CACO_AdjustPotionThread05 thread05
CACO_AdjustPotionThread06 thread06
CACO_AdjustPotionThread07 thread07
CACO_AdjustPotionThread08 thread08
CACO_AdjustPotionThread09 thread09
CACO_AdjustPotionThread10 thread10
CACO_AdjustPotionThread11 thread11
CACO_AdjustPotionThread12 thread12
CACO_AdjustPotionThread13 thread13
CACO_AdjustPotionThread14 thread14
CACO_AdjustPotionThread15 thread15
CACO_AdjustPotionThread16 thread16
CACO_AdjustPotionThread17 thread17
CACO_AdjustPotionThread18 thread18
CACO_AdjustPotionThread19 thread19
CACO_AdjustPotionThread20 thread20
CACO_AdjustPotionThread21 thread21
CACO_AdjustPotionThread22 thread22
CACO_AdjustPotionThread23 thread23
CACO_AdjustPotionThread24 thread24
CACO_AdjustPotionThread25 thread25
CACO_AdjustPotionThread26 thread26
CACO_AdjustPotionThread27 thread27
CACO_AdjustPotionThread28 thread28
CACO_AdjustPotionThread29 thread29
CACO_AdjustPotionThread30 thread30
 
Event OnInit()
    RegisterForModEvent("CACO_OnPotionCreation", "OnPotionCreation")			  
    thread01 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread01
    thread02 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread02
    thread03 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread03
    thread04 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread04
    thread05 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread05
    thread06 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread06
    thread07 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread07
    thread08 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread08
    thread09 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread09
    thread10 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread10
    thread11 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread11
    thread12 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread12
    thread13 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread13
    thread14 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread14
    thread15 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread15
    thread16 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread16
    thread17 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread17
    thread18 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread18
    thread19 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread19
    thread20 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread20
	thread21 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread21
    thread22 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread22
    thread23 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread23
    thread24 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread24
    thread25 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread25
    thread26 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread26
    thread27 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread27
    thread28 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread28
    thread29 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread29
    thread30 = CACO_AdjustPotionQuest as CACO_AdjustPotionThread30
EndEvent
 
function AdjustPotionAsync(Potion akPotion, int iDamageHealthDuration, int iDamageMagickaDuration, int iDamageStaminaDuration, int iRestoreHealthDuration, int iRestoreMagickaDuration, int iRestoreStaminaDuration)
    if !thread01.queued() && thread_limit >= 1
		;debug.notification("[Callback] Selected thread01")
        thread01.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread02.queued() && thread_limit >= 2
        ;debug.notification("[Callback] Selected thread02")
		thread02.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread03.queued() && thread_limit >= 3
		;debug.notification("[Callback] Selected thread03")
        thread03.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread04.queued() && thread_limit >= 4
		;debug.notification("[Callback] Selected thread04")
        thread04.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread05.queued() && thread_limit >= 5
		;debug.notification("[Callback] Selected thread05")
        thread05.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread06.queued() && thread_limit >= 6
		;debug.notification("[Callback] Selected thread06")
        thread06.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread07.queued() && thread_limit >= 7
		;debug.notification("[Callback] Selected thread07")
        thread07.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread08.queued() && thread_limit >= 8
		;debug.notification("[Callback] Selected thread08")
        thread08.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread09.queued() && thread_limit >= 9
		;debug.notification("[Callback] Selected thread09")
        thread09.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread10.queued() && thread_limit >= 10
		;debug.notification("[Callback] Selected thread10")
        thread10.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread11.queued() && thread_limit >= 11
		;debug.notification("[Callback] Selected thread11")
        thread11.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread12.queued() && thread_limit >= 12
		;debug.notification("[Callback] Selected thread12")
        thread12.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread13.queued() && thread_limit >= 13
		;debug.notification("[Callback] Selected thread13")
        thread13.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread14.queued() && thread_limit >= 14
        ;debug.notification("[Callback] Selected thread14")
        thread14.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread15.queued() && thread_limit >= 15
        ;debug.notification("[Callback] Selected thread15")
        thread15.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread16.queued() && thread_limit >= 16
        ;debug.notification("[Callback] Selected thread16")
        thread16.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread17.queued() && thread_limit >= 17
        ;debug.notification("[Callback] Selected thread17")
        thread17.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread18.queued() && thread_limit >= 18
        ;debug.notification("[Callback] Selected thread18")
        thread18.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread19.queued() && thread_limit >= 19
		;debug.notification("[Callback] Selected thread19")
        thread19.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread20.queued() && thread_limit >= 20
		;debug.notification("[Callback] Selected thread20")
        thread20.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread21.queued() && thread_limit >= 21
		;debug.notification("[Callback] Selected thread21")
        thread21.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread22.queued() && thread_limit >= 22
		;debug.notification("[Callback] Selected thread22")
        thread22.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread23.queued() && thread_limit >= 23
		;debug.notification("[Callback] Selected thread23")
        thread23.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread24.queued() && thread_limit >= 24
        ;debug.notification("[Callback] Selected thread24")
        thread24.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread25.queued() && thread_limit >= 25
        ;debug.notification("[Callback] Selected thread25")
        thread25.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread26.queued() && thread_limit >= 26
        ;debug.notification("[Callback] Selected thread26")
        thread26.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread27.queued() && thread_limit >= 27
        ;debug.notification("[Callback] Selected thread27")
        thread27.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread28.queued() && thread_limit >= 28
        ;debug.notification("[Callback] Selected thread28")
        thread28.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread29.queued() && thread_limit >= 29
		;debug.notification("[Callback] Selected thread29")
        thread29.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
    elseif !thread30.queued() && thread_limit >= 30
		;debug.notification("[Callback] Selected thread30")
        thread30.get_async(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)		
	else
		;All threads are queued; start all threads, wait, and try again.
		;debug.notification("[Callback] All threads queued")
        wait_all()
        AdjustPotionAsync(akPotion, iDamageHealthDuration, iDamageMagickaDuration, iDamageStaminaDuration, iRestoreHealthDuration, iRestoreMagickaDuration, iRestoreStaminaDuration)
	endif
endFunction

; KLV: technically this should now be called wait_any(), since that's what it does
; ..but that means renaming it everywhere, so I'll let you decide if you want to do that
function wait_all()
    RaiseEvent_OnPotionCreation()
    begin_waiting()
endFunction

function begin_waiting()
    bool waiting = true
    int i = 0
    while waiting
	    ; KLV: By changing these to AND instead of OR, it ensures that, as soon as ANY thread is free, we stop waiting and continue on to call AdjustPotionAsync again.
		; I think this is preferable in situations where AdjustPotionAsync is being called an unpredictable number of times, and at unpredictable intervals
        if thread01.queued() && thread02.queued() && thread03.queued() && thread04.queued() && thread05.queued() && \
           thread06.queued() && thread07.queued() && thread08.queued() && thread09.queued() && thread10.queued() && \ 
           thread11.queued() && thread12.queued() && thread13.queued() && thread14.queued() && thread15.queued() && \ 
           thread16.queued() && thread17.queued() && thread18.queued() && thread19.queued() && thread20.queued() && \
		   thread21.queued() && thread22.queued() && thread23.queued() && thread24.queued() && thread25.queued() && \ 
           thread26.queued() && thread27.queued() && thread28.queued() && thread29.queued() && thread30.queued()
            i += 1
            Utility.wait(0.1)
            if i >= 100
                debug.trace("Error: A catastrophic error has occurred. All threads have become unresponsive. Please debug this issue or notify the author.")
                i = 0
                ;Fail by returning None. The mod needs to be fixed.
                return
            endif
        else
            waiting = false
        endif
    endWhile
endFunction

;Create the ModEvent that will start this thread
function RaiseEvent_OnPotionCreation()
    int handle = ModEvent.Create("CACO_OnPotionCreation")
        ;debug.notification("Mod Event call: On Potion Creation")
    if handle
        ModEvent.Send(handle)
    else
        ;pass
    endif
endFunction