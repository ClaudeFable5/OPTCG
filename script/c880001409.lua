-- AUTO-GENERATED: OP11-075 / 하그왈 D. 사우로
-- rules_id=OP11-075 script_id=880001409 fingerprint=0f7a2212587dbd7c5584a28003359e6226bbdf415001881a652d9108a3fc412f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-075]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            name=[[니코 로빈]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
          {
            count=7,
            op=[[FIELD_DON_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 「니코 로빈」이고, 자신 필드의 두웅!!이 7장 이상인 경우, 카드를 2장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            effect_timing=[[ON_PLAY]],
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
    rules_id=[[OP11-075]],
    schema_version=1,
  })
end
