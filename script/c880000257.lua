-- AUTO-GENERATED: OP02-013 / 포트거스 D. 에이스
-- rules_id=OP02-013 script_id=880000257 fingerprint=a8e7287547cec4936c0c21624e41c2c3421cd4b356699ef8fd156c8324d092aa
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-013]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-3000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=2,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            actions={
              {
                duration=[[THIS_TURN]],
                keyword=[[RUSH]],
                op=[[GAIN_KEYWORD]],
                selector={
                  count=1,
                  kind=[[SELF]],
                  mode=[[UP_TO]],
                  owner=[[YOU]],
                },
              },
            },
            conditions={
              {
                op=[[LEADER_TRAIT_CONTAINS]],
                player=[[YOU]],
                trait=[[흰 수염 해적단]],
              },
            },
            op=[[IF]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】이번 턴 동안, 상대의 캐릭터 2장까지의 파워 -3000. 그 후, 자신의 리더가 『흰 수염 해적단』을 포함한 특징을 가진 경우, 이번 턴 동안, 이 캐릭터는 【속공】을 얻는다.
(이 카드는 등장한 턴에 어택할 수 있다)]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-013]],
    schema_version=1,
  })
end
