-- AUTO-GENERATED: OP14-060 / 돈키호테 도플라밍고
-- rules_id=OP14-060 script_id=880002225 fingerprint=dbf44c5dafce4db9a9e1004d11fa5f71e2742c9e4e8d8a4278895080c74e2aea
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-060]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[CHANGE_ATTACK_TARGET]],
            selector={
              count=1,
              filter={
                trait=[[돈키호테 해적단]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【상대의 어택 시】【턴 1회】두웅!!-1: 자신의 리더나 《돈키호테 해적단》 특징을 가진 캐릭터 1장을 고른다. 고른 카드로 어택의 대상을 변경한다.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-060]],
    schema_version=1,
  })
end
