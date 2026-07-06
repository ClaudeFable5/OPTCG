-- AUTO-GENERATED: OP04-033 / 마하바이스
-- rules_id=OP04-033 script_id=880000524 fingerprint=072357a1275fb1ca719f0bf4bbb88529d8702a31cf07e7fef68c32682e7bf2c2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-033]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=5,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
            schedule=[[THIS_TURN_END]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[돈키호테 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《돈키호테 해적단》 특징을 가진 경우, 상대의 코스트 5 이하인 캐릭터를 1장까지 레스트로 한다. 그 후, 이번 턴 종료 시, 자신의 두웅!!을 1장까지 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-033]],
    schema_version=1,
  })
end
