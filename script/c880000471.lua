-- AUTO-GENERATED: OP03-105 / 샬롯 오븐
-- rules_id=OP03-105 script_id=880000471 fingerprint=b49c021c7c58dfd278ffb5b69cd582012fb1d7b791da83ce90fb3c3cc4ee08e7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-105]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              has_trigger=true,
            },
            op=[[TRASH_HAND]],
          },
        },
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】자신의 패에서 【트리거】를 가진 카드 1장을 버릴 수 있다: 이번 배틀 동안, 이 캐릭터의 파워 +3000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-105]],
    schema_version=1,
  })
end
