-- AUTO-GENERATED: OP04-085 / 술레이만
-- rules_id=OP04-085 script_id=880000577 fingerprint=4305726d724860f9e7ead7bb9e1915ffc63e3546b4c60cb3e3f2686f2ecf4733
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-085]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            count=1,
            op=[[MILL_DECK]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[드레스로자]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】/【어택 시】자신의 리더가 《드레스로자》 특징을 가진 경우, 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -2. 그 후, 자신의 덱 위에서 1장을 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-085]],
    schema_version=1,
  })
end
