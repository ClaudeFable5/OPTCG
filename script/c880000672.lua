-- AUTO-GENERATED: OP05-060 / 몽키 D. 루피
-- rules_id=OP05-060 script_id=880000672 fingerprint=dbd3cd07e7f46b73d2474324d829f14916d72e0cb7c1f5936cee444963937a62
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-060]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            actions={
              {
                count=1,
                mode=[[UP_TO]],
                op=[[ADD_DON]],
                player=[[YOU]],
                state=[[ACTIVE]],
              },
            },
            conditions={
              {
                eq=0,
                gte=3,
                op=[[FIELD_DON_EQ_OR_GTE]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 라이프 위에서 1장을 패에 더할 수 있다: 자신 필드의 두웅!!이 0장 또는 3장 이상인 경우, 두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-060]],
    schema_version=1,
  })
end
