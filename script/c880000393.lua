-- AUTO-GENERATED: OP03-027 / 샴
-- rules_id=OP03-027 script_id=880000393 fingerprint=e42c995f0e10ba968e1a5c399c2ce3ae9626d4c54a866df209066279eba4c9ff
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-027]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=2,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            actions={
              {
                count=1,
                filter={
                  name=[[뿌찌]],
                },
                mode=[[UP_TO]],
                op=[[PLAY_FROM_HAND]],
                player=[[YOU]],
                rested=false,
              },
            },
            conditions={
              {
                name=[[뿌찌]],
                op=[[CHARACTER_NAME_ABSENT]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[이스트 블루]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《이스트 블루》 특징을 가진 경우, 상대의 코스트 2 이하인 캐릭터를 1장까지 레스트로 하고, 자신의 「뿌찌」가 없는 경우, 자신의 패에서 「뿌찌」를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-027]],
    schema_version=1,
  })
end
