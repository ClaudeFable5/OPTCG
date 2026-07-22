-- AUTO-GENERATED: OP14-108 / 실버즈 레일리
-- rules_id=OP14-108 script_id=880002273 fingerprint=cf501fa023c83c8635151549076471c2d2ee516a43e98c77ffddc6a83c053ae5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-108]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                base_power_lte=7000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_IS_MULTICOLOR]],
            player=[[YOU]],
          },
          {
            count=3,
            op=[[LIFE_LTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 다색이고, 상대의 라이프가 3장 이하인 경우, 상대의 원래 파워가 7000 이하인 캐릭터 1장까지를 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            op=[[ACTIVATE_CARD_EFFECT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드의 【등장 시】 효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-108]],
    schema_version=1,
  })
end
