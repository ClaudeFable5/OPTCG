-- AUTO-GENERATED: OP06-028 / 제오
-- rules_id=OP06-028 script_id=880000762 fingerprint=8fab2c467cf848874faf44a0760f1b759c4cac8f8cf8e16b6c59c4b303a24dd2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-028]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            player=[[YOU]],
            position=[[TOP]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[신 어인 해적단]],
          },
        },
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】자신의 리더가 《신 어인 해적단》 특징을 가진 경우, 자신의 두웅!!을 1장까지 액티브로 하고, 이번 턴 동안, 이 캐릭터의 파워 +1000. 그 후, 자신의 라이프 위에서 1장을 패에 더한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-028]],
    schema_version=1,
  })
end
