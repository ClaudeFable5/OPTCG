-- AUTO-GENERATED: OP14-082 / 부히챠크
-- rules_id=OP14-082 script_id=880002247 fingerprint=153026e92b333d9f046aa3916ab60060528f256bc7fc3629f9e4cd892d95f860
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-082]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=4,
            duration=[[UNTIL_OPPONENT_NEXT_TURN_END]],
            op=[[MODIFY_COST]],
            selector={
              count=0,
              filter={
                trait=[[스릴러 바크 해적단]],
              },
              kind=[[CHARACTER]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 《스릴러 바크 해적단》 특징을 가진 모든 캐릭터를, 다음 상대의 엔드 페이즈 종료 시까지, 코스트 +4.]],
        timings={
          [[ON_KO]],
        },
      },
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=2,
              trait=[[스릴러 바크 해적단]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 트래시에서 코스트 2 이하인 《스릴러 바크 해적단》 특징을 가진 캐릭터 카드 1장까지를 레스트로 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-082]],
    schema_version=1,
  })
end
