-- AUTO-GENERATED: EB04-027 / 보아 행콕
-- rules_id=EB04-027 script_id=880002448 fingerprint=a069d4924ca185b03d770a4b04495dd9c2bb5432d89ec94f10d658dae8fee9fb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-027]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】카드를 2장 뽑고, 자신의 패 1장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              has_trigger=true,
              power_lte=5000,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[【트리거】자신의 패에서 파워 5000 이하인 【트리거】를 가진 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-027]],
    schema_version=1,
  })
end
