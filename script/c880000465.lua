-- AUTO-GENERATED: OP03-099 / 샬롯 카타쿠리
-- rules_id=OP03-099 script_id=880000465 fingerprint=38d7e67c00f7c58710c883aef7d6631a5291da4db02df27ad4ebed1cec1ed254
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-099]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            choose_player=true,
            count=1,
            destinations={
              [[LIFE_TOP]],
              [[LIFE_BOTTOM]],
            },
            op=[[LOOK_REORDER_LIFE_TOP]],
            player=[[ANY]],
          },
          {
            amount=1000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】자신 또는 상대의 라이프 위에서 1장까지를 보고, 라이프 맨 위나 아래로 되돌린다. 그 후, 이번 배틀 동안, 이 리더의 파워 +1000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-099]],
    schema_version=1,
  })
end
